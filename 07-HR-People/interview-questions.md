# 📝 Bank Pertanyaan Interview

**Interview Questions Database**

**Tanggal Efektif:** 1 Januari 2024
**Versi:** 1.0
**Status:** Aktif
**Disetujui oleh:** Tech Lead & HR Manager

---

## 📋 Panduan Penggunaan

### **Struktur Interview:**

1. **Technical Assessment:** 60-70% dari interview time
2. **Behavioral Assessment:** 20-30% dari interview time
3. **Cultural Fit:** 10-15% dari interview time
4. **Candidate Questions:** 5-10% untuk candidate questions

### **Evaluasi Criteria:**

- **Problem Solving:** Kemampuan menganalisis dan menyelesaikan masalah
- **Technical Depth:** Pemahaman teknis yang mendalam
- **Communication:** Kemampuan menjelaskan konsep teknis
- **Collaboration:** Kemampuan bekerja dalam tim
- **Learning Agility:** Kemampuan belajar hal baru

---

## 🔧 Technical Questions

### **Go Programming Questions**

#### **Fundamental Concepts:**

1. **Interfaces dan Types:**

   ```go
   // Apa output dari kode ini?
   type Shape interface {
       Area() float64
   }

   type Circle struct {
       radius float64
   }

   func (c Circle) Area() float64 {
       return 3.14 * c.radius * c.radius
   }

   func main() {
       var s Shape = Circle{radius: 5}
       fmt.Println(s.Area())
   }
   ```

2. **Goroutines dan Channels:**

   ```go
   // Implement pattern untuk worker pool menggunakan goroutines dan channels
   type Worker struct {
       id int
       jobs chan Job
       results chan Result
   }

   func (w Worker) Start() {
       // Implement worker logic
   }
   ```

3. **Error Handling:**
   - "Bagaimana cara Go menghandle errors dibandingkan exceptions di Java?"
   - "Implement custom error types dengan proper error wrapping"
   - "Best practices untuk error handling di production code"

#### **Data Structures:**

4. **Concurrency Patterns:**
   - "Implement producer-consumer pattern menggunakan channels"
   - "Bagaimana mencegah race conditions di Go?"
   - "Explain select statement dan use casesnya"

5. **Memory Management:**
   - "Bagaimana Go mengelola memory allocation?"
   - "Apa itu garbage collection di Go?"
   - "Implement cache dengan automatic cleanup"

#### **Web Development:**

6. **Net/HTTP:**
   - "Implement REST API dengan Go using standard library"
   - "Bagaimana handle middleware di Go web server?"
   - "Implement rate limiting untuk API"

7. **Database Integration:**
   - "Connect Go application dengan PostgreSQL"
   - "Implement connection pooling"
   - "Handle database transactions dengan proper rollback"

### **PHP/Laravel Questions**

#### **Fundamental PHP:**

1. **OOP Concepts:**

   ```php
   // Explain output dari kode ini
   class A {
       private $prop = "A";

       public function show() {
           echo $this->prop;
       }
   }

   class B extends A {
       private $prop = "B";

       public function show() {
           parent::show();
           echo $this->prop;
       }
   }

   $b = new B();
   $b->show();
   ```

2. **Autoloading dan Namespaces:**
   - "Bagaimana PSR-4 autoloading bekerja?"
   - "Implement custom autoloader"
   - "Best practices untuk namespace organization"

#### **Laravel Specific:**

3. **Eloquent ORM:**
   - "Explain Eloquent relationships: hasOne, hasMany, belongsTo"
   - "Implement polymorphic relationships"
   - "Eager loading vs lazy loading dalam query optimization"

4. **Laravel Architecture:**
   - "Explain Service Provider lifecycle"
   - "How does Laravel handle HTTP requests?"
   - "Implement custom middleware"

5. **Database Design:**
   - "Design database schema untuk e-commerce"
   - "Implement soft deletes dan proper indexing"
   - "Database migrations dan rollback strategies"

### **JavaScript/Node.js Questions**

#### **JavaScript Fundamentals:**

1. **Async Programming:**
   - "Explain Promise, async/await, dan callback hell"
   - "Implement debounce function"
   - "Handle multiple async requests secara parallel"

2. **Closures dan Scope:**
   - "What is closure dalam JavaScript?"
   - "Explain this keyword di different contexts"
   - "Implement module pattern dengan closures"

#### **React/Modern Frontend:**

3. **React Concepts:**
   - "Virtual DOM dan reconciliation process"
   - "Component lifecycle vs hooks"
   - "State management: local vs Redux vs Context"

4. **Frontend Architecture:**
   - "Implement component composition"
   - "Code splitting dan lazy loading"
   - "Performance optimization techniques"

### **Database Questions**

#### **SQL:**

1. **Query Optimization:**

   ```sql
   -- Optimize query ini
   SELECT u.name, COUNT(o.id) as order_count
   FROM users u
   LEFT JOIN orders o ON u.id = o.user_id
   WHERE u.created_at > '2024-01-01'
   GROUP BY u.id, u.name
   HAVING COUNT(o.id) > 5
   ORDER BY order_count DESC;
   ```

2. **Indexing Strategy:**
   - "Kapan menggunakan composite indexes?"
   - "Impact dari indexes pada write performance"
   - "Covering indexes dan include columns"

3. **Database Design:**
   - "Normalize vs denormalize: when dan why?"
   - "Implement audit trail untuk data changes"
   - "Design schema untuk multi-tenancy"

#### **NoSQL:**

4. **MongoDB:**
   - "Schema design patterns untuk MongoDB"
   - "Aggregation framework examples"
   - "Indexing strategies untuk different query patterns"

### **System Design Questions**

#### **Scale Architecture:**

1. **Load Balancer:**
   - "Design load balancer untuk high-traffic website"
   - "Algoritma load balancing: round robin, least connections"
   - "Health checks dan failover mechanisms"

2. **Caching Strategies:**
   - "Redis vs Memcached: when to use each?"
   - "Cache invalidation strategies"
   - "Distributed cache synchronization"

3. **Microservices:**
   - "Monolith vs microservices: pros dan cons"
   - "Service discovery dan communication patterns"
   - "Data consistency dalam distributed systems"

4. **API Design:**

   ```markdown
   ## RESTful API Design
   Design API untuk:
   - User management system
   - File upload service dengan progress tracking
   - Real-time notification system
   - Analytics dashboard API
   ```

---

## 🗣️ Behavioral Questions

### **Problem Solving**

#### **Technical Problem Solving:**

1. **Complex Debugging:**
   - "Describe technical problem paling challenging yang pernah kamu selesaikan. Bagaimana pendekatanmu?"
   - "Kapan terakhir kali kamu debug production issue? Prosesnya seperti apa?"
   - "Alat atau teknik debugging favoritmu dan mengapa?"

2. **Learning New Technologies:**
   - "Bagaimana kamu belajar teknologi baru? Berikan contoh nyata."
   - "Teknologi apa yang sedang kamu pelajari dan mengapa?"
   - "Bagaimana kamu stay updated dengan teknologi development?"

#### **Non-Technical Problem Solving:**

3. **Project Management:**
   - "Describe project yang memiliki timeline yang ketat. Bagaimana kamu memastikan timely delivery?"
   - "Bagaimana kamu handle requirement changes di tengah project?"
   - "Experience dengan managing stakeholders expectations?"

4. **Conflict Resolution:**
   - "Describe situasi dimana kamu tidak setuju dengan technical decision. Bagaimana kamu handle?"
   - "Bagaimana kamu resolve conflict dengan team member?"
   - "Experience dengan dealing dengan difficult client atau stakeholder?"

### **Team Collaboration**

#### **Teamwork:**

5. **Collaboration Experience:**
   - "Describe project terbaik yang kamu kerjakan dalam tim. Role kamu apa dan bagaimana kamu kontribusi?"
   - "Bagaimana kamu mentor junior developer? Berikan contoh nyata."
   - "Experience dengan cross-functional team collaboration?"

6. **Communication:**
   - "Bagaimana kamu komunikasi technical concepts kepada non-technical stakeholders?"
   - "Describe situasi dimana kamu harus explain complex technical issue kepada management."
   - "Bagaimana kamu handle miscommunication dalam team?"

#### **Leadership Potential:**

7. **Leadership Examples:**
   - "Situasi dimana kamu mengambil leadership tanpa being asked. Bagaimana hasilnya?"
   - "Bagaimana kamu motivate team during challenging project?"
   - "Experience dengan delegating tasks dan trust building?"

### **Work Style dan Preferences**

#### **Work Environment:**

8. **Work Style:**
   - "Prefer remote work atau office? Mengapa?"
   - "Bagaimana kamu maintain work-life balance?"
   - "Work environment seperti apa yang membantu kamu perform terbaik?"

9. **Time Management:**
   - "Bagaimana kamu prioritize multiple deadlines?"
   - "Experience dengan managing conflicting priorities?"
   - "Bagaimana kamu handle burnout atau stress?"

#### **Career Goals:**

10. **Career Development:**
    - "Apa career goals kamu dalam 2-5 tahun ke depan?"
    - "Skill apa yang ingin kamu develop dalam next year?"
    - "Bagaimana posisi ini align dengan career goals kamu?"

---

## 🎭 Role-Specific Questions

### **Backend Developer Questions**

#### **Backend Architecture:**

1. "Design backend architecture untuk social media app dengan 1M users"
2. "Bagaimana kamu handle database migrations di production?"
3. "Implement rate limiting untuk API endpoints"
4. "Authentication dan authorization best practices"

#### **API Development:**

5. "REST vs GraphQL: when to use each?"
6. "Implement API versioning strategy"
7. "Error handling best practices untuk APIs"
8. "Security considerations untuk public APIs"

### **Frontend Developer Questions**

#### **Frontend Architecture:**

1. "State management: Redux vs Context vs Zustand - when to use each?"
2. "Component design principles dan best practices"
3. "Performance optimization techniques untuk single page applications"
4. "Responsive design challenges dan solutions"

#### **Modern Frontend:**

5. "Server-side rendering vs client-side rendering"
6. "Progressive Web App implementation strategies"
7. "Cross-browser compatibility challenges"
8. "Accessibility compliance (WCAG) implementation"

### **DevOps Engineer Questions**

#### **Infrastructure:**

1. "Infrastructure as Code using Terraform atau similar tools"
2. "Container orchestration dengan Kubernetes"
3. "CI/CD pipeline design dan implementation"
4. "Monitoring dan observability strategies"

#### **DevOps Practices:**

5. "Blue-green deployment vs canary releases"
6. "Disaster recovery planning dan implementation"
7. "Security dalam DevOps pipeline"
8. "Cost optimization strategies"

### **QA Engineer Questions**

#### **Testing Strategies:**

1. "Test pyramid: unit, integration, E2E testing balance"
2. "Automated testing untuk REST APIs"
3. "Performance testing strategies dan tools"
4. "Security testing methodologies"

#### **Quality Assurance:**

5. "Bug tracking dan prioritization framework"
6. "Test case design principles"
7. "Accessibility testing implementation"
8. "Cross-platform testing challenges"

### **UI/UX Designer Questions**

#### **Design Process:**

1. "Design thinking process untuk new product features"
2. "User research methodologies dan when to apply"
3. "Design system implementation dan maintenance"
4. "Mobile-first vs desktop-first design decisions"

#### **Design Principles:**

5. "Accessibility design principles dan implementation"
6. "Responsive design challenges dan solutions"
7. "Usability testing methodologies"
8. "Design collaboration dengan development team"

### **Project Manager Questions**

#### **Project Management:**

1. "Agile vs Waterfall: when to use each methodology?"
2. "Stakeholder management strategies"
3. "Risk management dalam software projects"
4. "Resource allocation untuk multiple projects"

#### **Leadership:**

5. "Team motivation strategies during challenging projects"
6. "Performance management and review processes"
7. "Conflict resolution dalam project teams"
8. "Client relationship management"

---

## 📊 Scenario-Based Questions

### **Technical Scenarios**

#### **System Design Scenario 1:**

**"You need to design a URL shortening service like bit.ly. Consider requirements:**

- Handle 1000 requests per second
- Generate short URLs with 6 characters
- Track click analytics
- Handle custom short URLs
- Implement rate limiting

**Questions:**

1. "What would be your system architecture?"
2. "How would you generate unique short URLs?"
3. "Database schema design?"
4. "How would you handle hot URLs that get millions of clicks?"

#### **System Design Scenario 2:**

**"Design a real-time chat application like Slack:**

- Support multiple chat rooms
- File sharing capability
- Message history and search
- Online/offline status
- Push notifications

**Questions:**

1. "Real-time communication technology choices?"
2. "Data storage strategy for messages?"
3. "How to handle message synchronization across devices?"
4. "Scalability considerations for large chat rooms?"

### **Behavioral Scenarios**

#### **Scenario 1: Conflict Resolution:**

**"You're working on a critical project with tight deadline. Senior architect suggests approach you believe is technically flawed and will cause maintenance issues later. How would you handle this situation?"

**Follow-up Questions:**

1. "What steps would you take first?"
2. "How would you communicate your concerns?"
3. "What if the architect insists on their approach?"
4. "How would you document your dissent?"

#### **Scenario 2: Team Management:**

**"Your team has consistently missed deadlines for the past 2 months. Team morale is low, and quality is declining. What actions would you take as a team lead?**"

**Follow-up Questions:**

1. "How would you diagnose the root cause?"
2. "What immediate actions would you take?"
3. "How would you address team morale?"
4. "How would you communicate with management?"

---

## 🔍 Whiteboard/Code Challenge Questions

### **Data Structure Challenges**

#### **Challenge 1: LRU Cache**

```go
// Implement LRU Cache dengan get dan put operations
type LRUCache struct {
    capacity int
    cache    map[int]*Node
    head     *Node
    tail     *Node
}

func Constructor(capacity int) LRUCache {
    // Implementation
}

func (this *LRUCache) Get(key int) int {
    // Get value and move to front
}

func (this *LRUCache) Put(key int, value int) {
    // Put or update value
}
```

#### **Challenge 2: Rate Limiter**

```go
// Implement rate limiter dengan sliding window
type RateLimiter struct {
    requests map[int][]time.Time
    window  time.Duration
    limit   int
}

func NewRateLimiter(window time.Duration, limit int) *RateLimiter {
    // Implementation
}

func (rl *RateLimiter) Allow(userID int) bool {
    // Check if request is allowed
}
```

### **Algorithm Challenges**

#### **Challenge 3: String Processing**

```go
// Function untuk check if string adalah valid email
func isValidEmail(email string) bool {
    // Implement regex-based validation
}

// Function untuk generate slug dari title
func generateSlug(title string) string {
    // Convert to lowercase, replace spaces with hyphens
    // Remove special characters
}
```

#### **Challenge 4: Array Manipulation**

```go
// Merge two sorted arrays without duplicates
func mergeSortedArrays(arr1, arr2 []int) []int {
    // Implementation
}

// Find longest substring without repeating characters
func longestSubstring(s string) string {
    // Implementation
}
```

---

## 🎯 Evaluation Guidelines

### **Technical Evaluation Rubric**

#### **Problem Solving (30%):**

- **Understanding (8/30):** Comprehend problem requirements
- **Approach (10/30):** Logical dan systematic approach
- **Implementation (12/30):** Code quality dan correctness

#### **Technical Knowledge (40%):**

- **Core Concepts (15/40):** Fundamental understanding
- **Best Practices (10/40):** Industry best practices
- **Language Specifics (15/40):** Language-specific knowledge

#### **Communication (20%):**

- **Explanation (10/20):** Clarity dalam explaining solutions
- **Discussion (10/20):** Discussion alternatives dan trade-offs

#### **Code Quality (10%):**

- **Clean Code (5/10):** Readability dan maintainability
- **Testing (5/10):** Test awareness dan coverage

### **Behavioral Evaluation Rubric**

#### **Problem Solving Skills (25%):**

- **Analytical Thinking (10/25):** Problem analysis skills
- **Creativity (7/25):** Innovative solutions
- **Practicality (8/25):** Practical approach

#### **Team Collaboration (25%):**

- **Communication (10/25):** Clear dan effective communication
- **Teamwork (10/25):** Collaboration experience
- **Leadership (5/25):** Leadership potential

#### **Cultural Fit (25%):**

- **Alignment with Values (15/25):** Culture fit assessment
- **Motivation (5/25):** Motivation dan drive
- **Adaptability (5/25):** Adaptability dan flexibility

#### **Career Alignment (25%):**

- **Career Goals (10/25):** Alignment dengan company goals
- **Learning Attitude (10/25):** Willingness to learn
- **Growth Potential (5/25):** Growth mindset

---

## 📝 Interviewer Guidelines

### **Interview Best Practices**

#### **Before Interview:**

1. **Review Resume Thoroughly:** Understand candidate background
2. **Prepare Questions:** Prepare specific questions untuk candidate
3. **Set Clear Objectives:** Know what you're evaluating
4. **Check Bias Awareness:** Be aware dari unconscious bias

#### **During Interview:**

1. **Create Comfortable Environment:** Make candidate feel comfortable
2. **Use Structured Approach:** Follow consistent question format
3. **Listen Actively:** Give candidate full attention
4. **Take Notes:** Document observations untuk evaluation

#### **After Interview:**

1. **Immediate Documentation:** Complete evaluation while fresh
2. **Objective Assessment:** Focus on job-relevant criteria
3. **Consistent Scoring:** Apply consistent scoring rubric
4. **Collaborative Discussion:** Discuss dengan other interviewers

### **Red Flags**

#### **Technical Red Flags:**

- **Cannot Explain Code:** Cannot explain their own code
- **Poor Problem Solving:** Lacks basic problem-solving skills
- **Resistance to Feedback:** Defensive saat ditantang
- **Poor Communication:** Cannot explain technical concepts clearly

#### **Behavioral Red Flags:**

- **Negative Attitude:** Negative attitude tentang previous employers
- **Blame Others:** Always blame others untuk failures
- **Lack of Ownership:** Tidak mengambil responsibility
- **Cultural Mismatch:** Clear cultural fit issues

### **Green Flags**

#### **Technical Green Flags:**

- **Clear Thinking:** Logical problem-solving approach
- **Code Quality:** Clean, readable code
- **Best Practices:** Demonstrates industry best practices
- **Continuous Learning:** Shows desire untuk learning

#### **Behavioral Green Flags:**

- **Positive Attitude:** Positive about challenges
- **Team Player:** Values collaboration
- **Growth Mindset:** Open untuk feedback dan learning
- **Leadership Potential:** Shows leadership qualities

---

## 📚 Question Bank Maintenance

### **Regular Updates:**

- **Quarterly Review:** Review dan update question bank
- **New Technologies:** Add questions untuk emerging technologies
- **Feedback Integration:** Incorporate feedback dari interviewers
- **Success Metrics:** Track question effectiveness

### **Question Categories:**

- **Difficulty Levels:** Junior, Mid, Senior, Lead
- **Technology Stack:** Go, PHP, JavaScript, Database, DevOps
- **Behavioral Categories:** Problem solving, leadership, teamwork
- **Scenario Types:** Technical, behavioral, situational

---

**Document Version:** 1.0
**Last Updated:** 1 Januari 2024
**Next Review:** 1 April 2024
**Maintained by:** Tech Lead & HR Manager, PT Akordium Lab Digital

> 💡 **Interview Success Tips:**
>
> - Focus pada assessing actual job requirements
> - Use consistent evaluation criteria across all candidates
> - Provide equal opportunities untuk semua kandidat
> - Document observations secara objektif
> - Create positive experience untuk all candidates, regardless outcome
