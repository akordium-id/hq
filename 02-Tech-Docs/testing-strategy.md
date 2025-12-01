# 🧪 Testing Strategy & Standards

Comprehensive testing methodology untuk semua produk Akordium Lab. Mendefinisikan testing pyramid, frameworks, standards, dan best practices untuk quality assurance.

## 🎯 Testing Philosophy

### **Core Principles**
- **Test-First Development:** Write tests before implementation
- **Quality over Quantity:** Focus on meaningful tests, not just coverage percentage
- **Automation First:** Manual testing untuk exploration only
- **Continuous Testing:** Tests run on every commit
- **Fast Feedback:** Quick test execution untuk developer productivity

### **Testing Pyramid**
```
              /\
             /  \  E2E Tests (10%)
            /____\    Critical user journeys
           /      \
          /        \ Integration Tests (20%)
         /__________\   API, Database, External Services
        /            \
       /______________\ Unit Tests (70%)
      /________________\ Fast, Isolated, Reliable
```

### **Technology Stack per Platform**

#### **Laravel (PHP)**
- **Unit Testing:** PHPUnit
- **Browser Testing:** Laravel Dusk (Chrome/ChromeDriver)
- **API Testing:** PHPUnit with HTTP assertions
- **Database Testing:** In-memory SQLite untuk testing

#### **Go**
- **Unit Testing:** Built-in `testing` package
- **API Testing:** `httptest` package
- **Benchmark Testing:** `testing/benchmark`
- **Mock Testing:** Testify atau gomock

#### **Next.js/React (TypeScript)**
- **Unit Testing:** Jest + React Testing Library
- **Component Testing:** Jest + React Testing Library
- **E2E Testing:** Playwright atau Cypress
- **API Testing:** Jest dengan Supertest

## 🔬 Unit Testing Standards

### **What to Test**
```php
// Laravel - Test Methods
class UserServiceTest extends TestCase
{
    // ✅ Test business logic
    public function test_create_user_with_valid_data()
    {
        $userData = [
            'name' => 'John Doe',
            'email' => 'john@example.com',
            'password' => 'password123'
        ];

        $user = $this->userService->createUser($userData);

        $this->assertInstanceOf(User::class, $user);
        $this->assertEquals('John Doe', $user->name);
        $this->assertEquals('john@example.com', $user->email);
        $this->assertTrue(Hash::check('password123', $user->password));
    }

    // ✅ Test edge cases
    public function test_create_user_with_duplicate_email_throws_exception()
    {
        // Create first user
        User::factory()->create(['email' => 'john@example.com']);

        // Try to create second user with same email
        $userData = [
            'name' => 'Jane Doe',
            'email' => 'john@example.com',
            'password' => 'password123'
        ];

        $this->expectException(EmailAlreadyExistsException::class);
        $this->userService->createUser($userData);
    }

    // ❌ Don't test framework functionality
    public function test_database_saves_data() // Bad test
    {
        // Don't test that Laravel saves to database
    }
}
```

```go
// Go - Test Functions
func TestUserService_CreateUser(t *testing.T) {
    // Setup
    service := NewUserService()
    user := User{
        Name:  "John Doe",
        Email: "john@example.com",
    }

    // Execute
    created, err := service.CreateUser(user)

    // Assert
    if err != nil {
        t.Fatalf("Failed to create user: %v", err)
    }

    if created.Name != user.Name {
        t.Errorf("Expected name %s, got %s", user.Name, created.Name)
    }

    if created.Email != user.Email {
        t.Errorf("Expected email %s, got %s", user.Email, created.Email)
    }

    if created.ID == 0 {
        t.Errorf("Expected non-zero ID, got %d", created.ID)
    }
}

func TestUserService_CreateUser_DuplicateEmail(t *testing.T) {
    // Setup
    service := NewUserService()
    user := User{
        Name:  "John Doe",
        Email: "john@example.com",
    }

    // Create first user
    _, err := service.CreateUser(user)
    if err != nil {
        t.Fatalf("Failed to create first user: %v", err)
    }

    // Try to create duplicate
    _, err = service.CreateUser(user)
    if err == nil {
        t.Error("Expected error when creating user with duplicate email")
    }
}
```

```typescript
// Next.js/React - Component Testing
import { render, screen, fireEvent, waitFor } from '@testing-library/react'
import { UserProfile } from './UserProfile'

describe('UserProfile', () => {
    const mockUser = {
        id: 1,
        name: 'John Doe',
        email: 'john@example.com'
    }

    it('displays user information correctly', () => {
        render(<UserProfile user={mockUser} />)

        expect(screen.getByText('John Doe')).toBeInTheDocument()
        expect(screen.getByText('john@example.com')).toBeInTheDocument()
    })

    it('handles edit mode correctly', async () => {
        render(<UserProfile user={mockUser} />)

        const editButton = screen.getByRole('button', { name: 'Edit' })
        fireEvent.click(editButton)

        await waitFor(() => {
            expect(screen.getByDisplayValue('John Doe')).toBeInTheDocument()
        })
    })

    it('validates email format', async () => {
        render(<UserProfile user={mockUser} />)

        fireEvent.click(screen.getByRole('button', { name: 'Edit' }))
        const emailInput = screen.getByLabelText('Email')
        fireEvent.change(emailInput, { target: { value: 'invalid-email' } })

        fireEvent.click(screen.getByRole('button', { name: 'Save' }))

        await waitFor(() => {
            expect(screen.getByText('Invalid email format')).toBeInTheDocument()
        })
    })
})
```

### **Unit Testing Best Practices**
- **One Assertion per Test:** Multiple assertions should test related behavior
- **Test Naming:** Clear, descriptive test names
- **Arrange-Act-Assert:** Consistent test structure
- **Isolation:** Tests should not depend on each other
- **Fast Execution:** Unit tests should run in milliseconds

## 🔗 Integration Testing

### **Database Testing**
```php
// Laravel Database Testing
class UserRepositoryTest extends TestCase
{
    use RefreshDatabase;

    public function test_find_user_by_email()
    {
        // Arrange
        $user = User::factory()->create([
            'email' => 'test@example.com'
        ]);

        // Act
        $found = $this->userRepository->findByEmail('test@example.com');

        // Assert
        $this->assertInstanceOf(User::class, $found);
        $this->assertEquals($user->id, $found->id);
    }
}
```

```go
// Go Database Testing
func TestUserRepository_FindByEmail(t *testing.T) {
    // Setup test database
    db := setupTestDB(t)
    defer cleanupTestDB(db)

    // Create table
    _, err := db.Exec(`
        CREATE TABLE users (
            id SERIAL PRIMARY KEY,
            name VARCHAR(255) NOT NULL,
            email VARCHAR(255) UNIQUE NOT NULL,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )
    `)
    if err != nil {
        t.Fatalf("Failed to create table: %v", err)
    }

    // Insert test data
    _, err = db.Exec(
        "INSERT INTO users (name, email) VALUES ($1, $2)",
        "Test User", "test@example.com",
    )
    if err != nil {
        t.Fatalf("Failed to insert test data: %v", err)
    }

    // Test repository
    repo := NewUserRepository(db)
    user, err := repo.FindByEmail("test@example.com")

    // Assert
    if err != nil {
        t.Fatalf("Failed to find user: %v", err)
    }

    if user.Name != "Test User" {
        t.Errorf("Expected name 'Test User', got %s", user.Name)
    }
}
```

### **API Testing**
```php
// Laravel API Testing
class UserAPITest extends TestCase
{
    public function test_get_user_details()
    {
        $user = User::factory()->create();

        $response = $this->actingAs($user)
            ->getJson("/api/v1/users/{$user->id}");

        $response->assertStatus(200)
            ->assertJsonStructure([
                'success',
                'data' => [
                    'id',
                    'name',
                    'email',
                    'created_at'
                ]
            ])
            ->assertJsonFragment([
                'success' => true,
                'data' => [
                    'id' => $user->id,
                    'name' => $user->name,
                    'email' => $user->email
                ]
            ]);
    }
}
```

```go
// Go API Testing
func TestGetUserDetails(t *testing.T) {
    // Setup
    db := setupTestDB(t)
    defer cleanupTestDB(db)

    user := User{
        Name:  "Test User",
        Email: "test@example.com",
    }
    err := db.Create(&user).Error
    if err != nil {
        t.Fatalf("Failed to create test user: %v", err)
    }

    // Setup router
    router := setupRouter()

    // Test request
    req, _ := http.NewRequest(
        "GET",
        fmt.Sprintf("/api/v1/users/%d", user.ID),
        nil,
    )
    req.Header.Set("Authorization", "Bearer "+generateTestToken(user.ID))

    rr := httptest.NewRecorder()
    router.ServeHTTP(rr, req)

    // Assert response
    if status := rr.Code; status != http.StatusOK {
        t.Errorf("Expected status %d, got %d", http.StatusOK, status)
    }

    var response map[string]interface{}
    err = json.Unmarshal(rr.Body.Bytes(), &response)
    if err != nil {
        t.Fatalf("Failed to parse response: %v", err)
    }

    if response["success"] != true {
        t.Error("Expected success to be true")
    }

    data := response["data"].(map[string]interface{})
    if data["name"] != user.Name {
        t.Errorf("Expected name %s, got %s", user.Name, data["name"])
    }
}
```

## 🌐 End-to-End Testing

### **Browser Testing with Laravel Dusk**
```php
// Laravel Dusk Example
class UserRegistrationTest extends DuskTestCase
{
    public function test_user_can_register_successfully()
    {
        $this->browse(function (Browser $browser) {
            $browser->visit('/register')
                ->assertSee('Register')
                ->type('name', 'John Doe')
                ->type('email', 'john@example.com')
                ->type('password', 'password123')
                ->type('password_confirmation', 'password123')
                ->press('Register')
                ->assertPathIs('/dashboard')
                ->assertSee('Welcome, John Doe');
        });
    }

    public function test_user_sees_validation_errors()
    {
        $this->browse(function (Browser $browser) {
            $browser->visit('/register')
                ->press('Register')
                ->assertSee('The name field is required')
                ->assertSee('The email field is required')
                ->assertSee('The password field is required');
        });
    }
}
```

### **E2E Testing with Playwright (Next.js)**
```typescript
// Playwright E2E Test Example
import { test, expect } from '@playwright/test'

test.describe('User Registration Flow', () => {
    test('user can register successfully', async ({ page }) => {
        // Navigate to registration page
        await page.goto('/register')

        // Fill out form
        await page.fill('[data-testid="name-input"]', 'John Doe')
        await page.fill('[data-testid="email-input"]', 'john@example.com')
        await page.fill('[data-testid="password-input"]', 'password123')
        await page.fill('[data-testid="confirm-password-input"]', 'password123')

        // Submit form
        await page.click('[data-testid="register-button"]')

        // Verify success
        await expect(page).toHaveURL('/dashboard')
        await expect(page.locator('[data-testid="welcome-message"]')).toContainText('Welcome, John Doe')
    })

    test('validation errors are displayed', async ({ page }) => {
        await page.goto('/register')

        // Submit empty form
        await page.click('[data-testid="register-button"]')

        // Verify validation errors
        await expect(page.locator('[data-testid="name-error"]')).toBeVisible()
        await expect(page.locator('[data-testid="email-error"]')).toBeVisible()
        await expect(page.locator('[data-testid="password-error"]')).toBeVisible()
    })

    test('password mismatch validation works', async ({ page }) => {
        await page.goto('/register')

        await page.fill('[data-testid="name-input"]', 'John Doe')
        await page.fill('[data-testid="email-input"]', 'john@example.com')
        await page.fill('[data-testid="password-input"]', 'password123')
        await page.fill('[data-testid="confirm-password-input"]', 'different-password')

        await page.click('[data-testid="register-button"]')

        await expect(page.locator('[data-testid="confirm-password-error"]')).toContainText('Passwords do not match')
    })
})
```

## 📊 Test Coverage Standards

### **Coverage Requirements**
- **Unit Tests:** Minimum 80% line coverage
- **Integration Tests:** Critical paths covered
- **E2E Tests:** Main user journeys covered
- **Focus on Quality:** Meaningful tests over coverage percentage

### **Coverage Analysis**
```bash
# PHP/Laravel Coverage
php artisan test --coverage-html

# Go Coverage
go test -coverprofile=coverage.out ./...
go tool cover -html=coverage.out

# JavaScript/TypeScript Coverage
npm test -- --coverage --coverageReport=html
```

### **Coverage Monitoring**
```yaml
# GitHub Actions Coverage Check
- name: Check coverage
  run: |
    # PHP
    php artisan test --coverage --min=80
    # Go
    go test -cover ./... | grep 'coverage:' | awk '{print $3}' | sed 's/%//' | awk '{ if ($1 < 80) exit 1 }'
    # JavaScript
    npm run coverage-check
```

## 🔄 Continuous Testing

### **GitHub Actions CI Pipeline**
```yaml
name: Tests

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest

    strategy:
      matrix:
        php-version: [8.2]
        node-version: [18]
        go-version: [1.21]

    services:
      postgres:
        image: postgres:15
        env:
          POSTGRES_PASSWORD: postgres
          POSTGRES_DB: testing
        options: >-
          --health-cmd pg_isready
          --health-interval 10s
          --health-timeout 5s
          --health-retries 5

    steps:
      - name: Checkout code
        uses: actions/checkout@v3

      - name: Setup PHP
        uses: shivammathur/setup-php@v2
        with:
          php-version: ${{ matrix.php-version }}
          extensions: pdo, pgsql, mbstring, xml, bcmath

      - name: Setup Node.js
        uses: actions/setup-node@v3
        with:
          node-version: ${{ matrix.node-version }}

      - name: Setup Go
        uses: actions/setup-go@v3
        with:
          go-version: ${{ matrix.go-version }}

      - name: Install dependencies
        run: |
          composer install --no-progress --no-interaction
          npm ci
          go mod download

      - name: Run tests
        run: |
          # Laravel tests
          php artisan test --coverage
          # Go tests
          go test -v -race -coverprofile=coverage.out ./...
          # JavaScript tests
          npm test --coverage

      - name: Upload coverage reports
        uses: codecov/codecov-action@v3
```

## 🛠️ Testing Tools & Configuration

### **PHPUnit Configuration**
```xml
<!-- phpunit.xml -->
<?xml version="1.0" encoding="UTF-8"?>
<phpunit xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:noNamespaceSchemaLocation="./vendor/phpunit/phpunit/phpunit.xsd"
         bootstrap="vendor/autoload.php"
         colors="true"
         stopOnFailure="false"
         failOnRisky="true"
         failOnWarning="true"
         strictCoverage="true"
         verbose="true"
         processIsolation="false">
    <testsuites>
        <testsuite name="Unit">
            <directory suffix="Test.php">./tests/Unit</directory>
        </testsuite>
        <testsuite name="Feature">
            <directory suffix="Test.php">./tests/Feature</directory>
        </testsuite>
    </testsuites>

    <coverage processUncoveredFiles="true">
        <include>
            <directory suffix=".php">./app</directory>
        </include>
        <exclude>
            <directory suffix=".php">./app/Http/Controllers/Auth</directory>
        </exclude>
        <report>
            <html outputDirectory="build/coverage"/>
            <text outputFile="build/coverage.txt"/>
            <clover outputFile="build/logs/clover.xml"/>
        </report>
    </coverage>
</phpunit>
```

### **Jest Configuration**
```javascript
// jest.config.js
module.exports = {
  preset: 'ts-jest',
  testEnvironment: 'jsdom',
  setupFilesAfterEnv: ['<rootDir>/tests/setup.ts'],
  moduleNameMapping: {
    '^@/(.*)$': '<rootDir>/src/$1',
  },
  testMatch: [
    '<rootDir>/src/**/__tests__/**/*.{js,jsx,ts,tsx}',
    '<rootDir>/src/**/*.{test,spec}.{js,jsx,ts,tsx}',
  ],
  collectCoverageFrom: [
    'src/**/*.{js,jsx,ts,tsx}',
    '!src/**/*.d.ts',
    '!src/index.tsx',
    '!src/types/**',
  ],
  coverageThreshold: {
    global: {
      branches: 80,
      functions: 80,
      lines: 80,
      statements: 80,
    },
  },
  coverageReporters: ['text', 'lcov', 'html'],
}
```

### **Go Test Configuration**
```go
// Test setup helper
package test

import (
    "database/sql"
    "fmt"
    "testing"

    _ "github.com/lib/pq"
)

// TestDB provides a test database connection
func TestDB(t *testing.T) *sql.DB {
    db, err := sql.Open("postgres", "postgres://postgres:password@localhost:5432/testdb?sslmode=disable")
    if err != nil {
        t.Fatalf("Failed to connect to test database: %v", err)
    }

    // Test connection
    if err := db.Ping(); err != nil {
        t.Fatalf("Failed to ping test database: %v", err)
    }

    return db
}

// CleanupDB cleans up test database
func CleanupDB(t *testing.T, db *sql.DB) {
    tables := []string{"users", "orders", "transactions"}

    for _, table := range tables {
        _, err := db.Exec(fmt.Sprintf("TRUNCATE TABLE %s CASCADE", table))
        if err != nil {
            t.Logf("Warning: Failed to truncate table %s: %v", table, err)
        }
    }

    db.Close()
}
```

## 📋 Test Documentation Standards

### **Test Documentation Requirements**
- **Test Purpose:** What the test validates
- **Preconditions:** Required setup conditions
- **Expected Outcome:** What constitutes success
- **Edge Cases:** Boundary conditions tested
- **Maintenance Notes:** Any special considerations

### **Test Template**
```php
/**
 * Test Purpose: Verify that user registration works with valid data
 *
 * Preconditions:
 * - Database is clean
 * - Registration form is accessible
 *
 * Expected Outcome:
 * - User account is created
 * - User is redirected to dashboard
 * - Welcome message is displayed
 *
 * Edge Cases Tested:
 * - Duplicate email handling
 * - Invalid email format
 * - Password mismatch
 * - Empty form validation
 */
class UserRegistrationTest extends TestCase
{
    // Test implementation...
}
```

## 🚨 Anti-Patterns to Avoid

### **Testing Anti-Patterns**
```php
// ❌ Don't test implementation details
public function test_database_query_correct()
{
    // Don't test specific SQL queries
}

// ❌ Don't test private methods
public function test_private_method()
{
    $reflection = new ReflectionClass($this->service);
    $method = $reflection->getMethod('privateMethod');
    $method->setAccessible(true);
    // Don't test private methods directly
}

// ❌ Don't test external dependencies
public function test_email_service_sends_email()
{
    // Don't test email service implementation
}

// ✅ Test public behavior
public function test_user_receives_welcome_email()
{
    // Test the behavior, not implementation
}
```

### **Test Maintenance Issues**
- **Brittle Tests:** Tests that break with minor implementation changes
- **Slow Tests:** Tests that take too long to run
- **Flaky Tests:** Tests that sometimes fail for no reason
- **Over-Specific Tests:** Tests that are too tightly coupled to implementation

---

**Remember:** Good tests are investments in code maintainability. They catch bugs early, serve as documentation, and enable confident refactoring. Focus on testing behavior, not implementation details.

*Related Documentation:* [Database Conventions](./database-conventions.md) | [API Design Guidelines](./api-design-guidelines.md) | [Security Practices](../01-SOP/security-practices.md) | [Code Review SOP](../01-SOP/code-review.md)