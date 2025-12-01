# 🔗 Third-Party Services

Comprehensive documentation untuk semua external services yang digunakan oleh Akordium Lab. Mencakup integrasi patterns, konfigurasi, cost optimization, dan fallback strategies.

## 🎯 Service Integration Philosophy

### **Integration Principles**

- **Vendor Independence:** Avoid vendor lock-in dengan abstraction layers
- **Multi-Cloud Strategy:** Distribute services across multiple providers
- **Cost Optimization:** Balance features dengan cost efficiency
- **Reliability:** Implement fallback dan redundancy mechanisms
- **Security:** Ensure all integrations meet security standards
- **Documentation:** Keep integration details updated

### **Service Categories**

```text
┌─────────────────────────────────────────┐
│           Third-Party Services          │
│    ┌─────────────────────────────────┐   │
│    │   Cloud Infrastructure           │   │
│    │   • Oracle Cloud Infrastructure │   │
│    │   • Cloudflare                  │   │
│    │   • DigitalOcean (Backup)       │   │
│    └─────────────────────────────────┘   │
│    ┌─────────────────────────────────┐   │
│    │   Payment & Financial           │   │
│    │   • Midtrans                   │   │
│    │   • Xendit                     │   │
│    │   • Stripe (International)     │   │
│    └─────────────────────────────────┘   │
│    ┌─────────────────────────────────┐   │
│    │   Communication                │   │
│    │   • SendGrid                   │   │
│    │   • WhatsApp Business API      │   │
│    │   • Twilio (SMS)               │   │
│    └─────────────────────────────────┘   │
│    ┌─────────────────────────────────┐   │
│    │   Analytics & Monitoring        │   │
│    │   • Sentry                     │   │
│    │   • Google Analytics           │   │
│    │   • Mixpanel                   │   │
│    └─────────────────────────────────┘   │
└─────────────────────────────────────────┘
```

## ☁️ Cloud Infrastructure Services

### **Oracle Cloud Infrastructure (OCI)**

#### **Service Overview**

```yaml
provider: "Oracle Cloud Infrastructure"
primary_use: "Main hosting platform"
cost_model: "Pay-as-you-go dengan committed usage discounts"
sla: "99.95% availability SLA"
support_tier: "Standard Support"
```

#### **Services Used**

```yaml
compute:
  - service: "VM.Standard.A2.Flex (ARM-based)"
    purpose: "Application servers"
    specs:
      cpu: "1-4 OCPU"
      memory: "1-24 GB"
      storage: "Local NVMe SSD"
    cost_per_hour: "~$0.015"
    instances:
      - "Production: 3 instances (2 OCPU, 8GB RAM)"
      - "Staging: 1 instance (1 OCPU, 4GB RAM)"
      - "Development: Shared instance"

  - service: "OCI Load Balancer"
    purpose: "Traffic distribution"
    type: "Public Load Balancer"
    bandwidth: "100 Mbps included"
    cost_per_hour: "~$0.025"

storage:
  - service: "Object Storage"
    purpose: "File storage, backups, static assets"
    class: "Standard"
    storage_tier: "Standard"
    cost_per_gb_month: "~$0.025"
    monthly_usage: "~500 GB"

  - service: "Block Volume"
    purpose: "Database storage"
    type: "Paravirtualized"
    performance_tier: "Balanced"
    cost_per_gb_month: "~$0.06"
    total_capacity: "1 TB"

networking:
  - service: "Virtual Cloud Network (VCN)"
    purpose: "Network isolation and security"
    cost: "Free tier covers first 10 VCNs"

  - service: "Internet Gateway"
    purpose: "Public internet access"
    cost: "Free"

database:
  - service: "PostgreSQL on VM"
    purpose: "Primary database"
    version: "PostgreSQL 15"
    high_availability: "Custom replica setup"
    cost: "Included in compute cost"
```

#### **Configuration Example**

```bash
# OCI CLI Configuration
oci setup config

# Environment Variables
export OCI_CLI_AUTH=instance_principal
export OCI_CLI_REGION=ap-singapore-1
export OCI_CLI_TENANCY=ocid1.tenancy.oc1..your-tenancy-id
export OCI_CLI_USER=ocid1.user.oc1..your-user-id
export OCI_CLI_FINGERPRINT=your-fingerprint
export OCI_CLI_KEY_FILE=~/.oci/oci_api_key.pem
```

```go
// pkg/oci/client.go
package oci

import (
    "context"
    "github.com/oracle/oci-go-sdk/common"
    "github.com/oracle/oci-go-sdk/objectstorage"
)

type OCIStorage struct {
    client objectstorage.ObjectStorageClient
    config common.ConfigurationProvider
}

func NewOCIStorage() (*OCIStorage, error) {
    config := common.DefaultConfigProvider()
    client, err := objectstorage.NewObjectStorageClientWithConfigurationProvider(config)
    if err != nil {
        return nil, err
    }

    return &OCIStorage{
        client: client,
        config: config,
    }, nil
}

func (s *OCIStorage) UploadFile(ctx context.Context, bucket, objectName string, data []byte) error {
    request := objectstorage.PutObjectRequest{
        NamespaceName: common.String("your-namespace"),
        BucketName:    common.String(bucket),
        ObjectName:    common.String(objectName),
        PutObjectBody: bytes.NewReader(data),
    }

    _, err := s.client.PutObject(ctx, request)
    return err
}
```

### **Cloudflare**

#### **Service Overview**

```yaml
provider: "Cloudflare"
primary_use: "CDN, DNS, security, and storage"
cost_model: "Free tier + Pro plan features"
sla: "99.99% uptime SLA"
support_tier: "Pro plan"
```

#### **Services Used**

```yaml
cdn:
  - service: "Cloudflare CDN"
    purpose: "Static asset delivery and caching"
    plan: "Pro ($20/month)"
    features:
      - "Image optimization"
      - "Argo Smart Routing"
      - "Web Application Firewall"
    bandwidth: "Unlimited"
    requests: "Unlimited"

dns:
  - service: "Cloudflare DNS"
    purpose: "Domain management"
    features:
      - "DNSSEC"
      - "DDoS protection"
      - "Load balancing"
    cost: "Free tier"

security:
  - service: "Cloudflare WAF"
    purpose: "Application security"
    rulesets:
      - "OWASP ModSecurity Core Rule Set"
      - "Cloudflare Managed Ruleset"
    cost: "Included in Pro plan"

storage:
  - service: "Cloudflare R2"
    purpose: "Object storage (S3 compatible)"
    cost_class: "Free tier: 10GB/month storage, 1M Class A operations"
    additional_cost: "$0.015/GB-month beyond free tier"
    egress_cost: "Free (no egress fees)"
```

#### **Configuration Example**

```javascript
// pkg/cloudflare/r2.go
package cloudflare

import (
    "context"
    "github.com/cloudflare/cloudflare-go"
)

type R2Storage struct {
    api      *cloudflare.API
    accountID string
}

func NewR2Storage(apiToken, accountID string) (*R2Storage, error) {
    api, err := cloudflare.NewWithAPIToken(apiToken)
    if err != nil {
        return nil, err
    }

    return &R2Storage{
        api:       api,
        accountID: accountID,
    }, nil
}

func (r *R2Storage) UploadFile(ctx context.Context, bucket, key string, data []byte, contentType string) error {
    // Use direct S3-compatible API
    s3Client := r.getS3Client()

    _, err := s3Client.PutObject(ctx, &s3.PutObjectInput{
        Bucket:      aws.String(bucket),
        Key:         aws.String(key),
        Body:        bytes.NewReader(data),
        ContentType: aws.String(contentType),
    })

    return err
}
```

### **DigitalOcean (Backup Provider)**

#### **Service Overview**

```yaml
provider: "DigitalOcean"
primary_use: "Backup and disaster recovery"
cost_model: "Pay-as-you-go"
sla: "99.99% uptime SLA"
```

#### **Services Used**

```yaml
backup:
  - service: "Droplets (Backup Servers)"
    purpose: "Off-site backup infrastructure"
    specs:
      cpu: "2 vCPU"
      memory: "4 GB RAM"
      storage: "80 GB SSD"
    cost_per_month: "$48"

  - service: "Spaces (Object Storage)"
    purpose: "Off-site backup storage"
    cost_per_gb_month: "$0.02"
    monthly_usage: "~200 GB"

  - service: "Volume Block Storage"
    purpose: "Database backups"
    cost_per_gb_month: "$0.10"
    total_capacity: "500 GB"
```

## 💳 Payment & Financial Services

### **Midtrans**

#### **Service Overview**

```yaml
provider: "Midtrans (Veritrans Indonesia)"
primary_use: "Primary payment gateway for Indonesian market"
cost_model: "Transaction-based fees"
payment_methods:
  - "Credit/Debit Cards (Visa, MasterCard, JCB)"
  - "Bank Transfer (VA)"
  - "E-wallet (GoPay, OVO, DANA, ShopeePay)"
  - "QRIS"
  - "Convenience Store (Alfamart, Indomaret)"
```

#### **Fee Structure**

```yaml
transaction_fees:
  credit_card:
    - "Visa/MasterCard: 2.9% + Rp 2,000"
    - "JCB: 3.4% + Rp 2,000"

  bank_transfer:
    - "BCA VA: Rp 4,000"
    - "Permata VA: Rp 4,000"
    - "BNI VA: Rp 4,000"
    - "BRI VA: Rp 4,500"

  e_wallet:
    - "GoPay: 2% + Rp 1,000"
    - "OVO: 2% + Rp 1,000"
    - "DANA: 2% + Rp 1,000"
    - "ShopeePay: 2% + Rp 1,000"

  qris:
    - "QRIS: 0.85% (capped at Rp 10,000)"

  convenience_store:
    - "Alfamart: Rp 5,000"
    - "Indomaret: Rp 5,000"

monthly_fees:
  - "No monthly subscription fee"
  - "Minimum settlement: Rp 10,000"
  - "Settlement schedule: T+1"
```

#### **Integration Example**

```php
<?php
// app/Services/Payment/MidtransService.php

namespace App\Services\Payment;

use Midtrans\Config;
use Midtrans\Snap;
use Midtrans\Notification;
use App\Models\Transaction;
use App\Models\PaymentMethod;

class MidtransService
{
    public function __construct()
    {
        $this->configure();
    }

    private function configure(): void
    {
        Config::$serverKey = config('services.midtrans.server_key');
        Config::$clientKey = config('services.midtrans.client_key');
        Config::$isProduction = config('services.midtrans.environment') === 'production';
        Config::$isSanitized = true;
        Config::$is3ds = true;
    }

    public function createPaymentUrl(Transaction $transaction): string
    {
        $params = [
            'transaction_details' => [
                'order_id' => $transaction->id,
                'gross_amount' => $transaction->amount,
            ],
            'customer_details' => [
                'first_name' => $transaction->user->first_name,
                'last_name' => $transaction->user->last_name,
                'email' => $transaction->user->email,
                'phone' => $transaction->user->phone,
            ],
            'item_details' => $this->buildItemDetails($transaction),
            'enabled_payments' => $this->getEnabledPaymentMethods(),
            'expiry' => [
                'start_time' => now()->format('Y-m-d H:i:s O'),
                'unit' => 'hours',
                'duration' => 24,
            ],
        ];

        try {
            $snapToken = Snap::getSnapToken($params);
            $transaction->update(['payment_token' => $snapToken]);

            return $snapToken;
        } catch (\Exception $e) {
            throw new PaymentException('Failed to create payment URL: ' . $e->getMessage());
        }
    }

    public function handleNotification(array $notificationData): Transaction
    {
        $notification = new Notification();

        $transaction = Transaction::findOrFail($notification->order_id);
        $transaction->payment_method_id = $this->getPaymentMethodId($notification->payment_type);
        $transaction->payment_status = $this->mapMidtransStatus($notification->transaction_status);
        $transaction->paid_at = $notification->transaction_time;

        if ($notification->transaction_status === 'settlement') {
            $transaction->status = 'completed';
            $this->processSuccessfulPayment($transaction);
        } elseif ($in_array($notification->transaction_status, ['deny', 'expire', 'cancel'])) {
            $transaction->status = 'failed';
            $this->processFailedPayment($transaction);
        }

        $transaction->save();

        return $transaction;
    }

    private function buildItemDetails(Transaction $transaction): array
    {
        // Build item details based on transaction type
        return [
            [
                'id' => $transaction->id,
                'price' => $transaction->amount,
                'quantity' => 1,
                'name' => $transaction->description,
                'category' => 'digital',
            ]
        ];
    }

    private function getEnabledPaymentMethods(): array
    {
        return [
            'credit_card',
            'bca_va',
            'permata_va',
            'bni_va',
            'bri_va',
            'gopay',
            'ovo',
            'shopeepay',
            'qris',
            'alfamart',
            'indomaret',
        ];
    }

    private function mapMidtransStatus(string $midtransStatus): string
    {
        $statusMap = [
            'capture' => 'paid',
            'settlement' => 'paid',
            'pending' => 'pending',
            'deny' => 'failed',
            'expire' => 'expired',
            'cancel' => 'cancelled',
        ];

        return $statusMap[$midtransStatus] ?? 'unknown';
    }
}
```

### **Xendit (Fallback Payment Gateway)**

#### **Service Overview**

```yaml
provider: "Xendit"
primary_use: "Backup payment gateway"
cost_model: "Transaction-based fees"
activation: "Active but not primary"
```

#### **Fee Structure**

```yaml
transaction_fees:
  credit_card:
    - "Visa/MasterCard: 2.9% + Rp 2,000"

  bank_transfer:
    - "Fixed VA: Rp 2,500"
    - "Dynamic VA: Rp 1,500"

  e_wallet:
    - "OVO: 2.08%"
    - "DANA: 2.08%"
    - "ShopeePay: 2.08%"

  disbursement:
    - "Bank transfer: Rp 6,500 (bank partner) / Rp 2,500 (H2H)"
```

#### **Fallback Implementation**

```go
// pkg/payment/gateway.go
package payment

import (
    "context"
    "errors"
    "fmt"
)

type Gateway interface {
    CreatePayment(ctx context.Context, req PaymentRequest) (*PaymentResponse, error)
    GetPaymentStatus(ctx context.Context, paymentID string) (*PaymentStatus, error)
    HandleWebhook(ctx context.Context, payload []byte) (*WebhookEvent, error)
}

type PaymentRequest struct {
    OrderID      string  `json:"order_id"`
    Amount       float64 `json:"amount"`
    Currency     string  `json:"currency"`
    Description  string  `json:"description"`
    CustomerID   string  `json:"customer_id"`
    PaymentMethods []string `json:"payment_methods"`
    CallbackURL  string  `json:"callback_url"`
}

type PaymentResponse struct {
    PaymentID   string `json:"payment_id"`
    PaymentURL  string `json:"payment_url"`
    ExpiresAt   string `json:"expires_at"`
    QRCode      string `json:"qr_code,omitempty"`
    VAInfo      *VAInfo `json:"va_info,omitempty"`
}

type PaymentManager struct {
    primaryGateway Gateway
    fallbackGateway Gateway
    circuitBreaker *CircuitBreaker
}

func NewPaymentManager(primary, fallback Gateway) *PaymentManager {
    return &PaymentManager{
        primaryGateway: primary,
        fallbackGateway: fallback,
        circuitBreaker: NewCircuitBreaker(5, 30*time.Second),
    }
}

func (pm *PaymentManager) CreatePayment(ctx context.Context, req PaymentRequest) (*PaymentResponse, error) {
    // Try primary gateway first
    if !pm.circuitBreaker.IsOpen() {
        resp, err := pm.primaryGateway.CreatePayment(ctx, req)
        if err == nil {
            pm.circuitBreaker.RecordSuccess()
            return resp, nil
        }
        pm.circuitBreaker.RecordFailure()
        log.Printf("Primary payment gateway failed: %v", err)
    }

    // Fallback to secondary gateway
    log.Println("Falling back to secondary payment gateway")
    resp, err := pm.fallbackGateway.CreatePayment(ctx, req)
    if err != nil {
        return nil, fmt.Errorf("all payment gateways failed: %w", err)
    }

    return resp, nil
}
```

## 📧 Communication Services

### **SendGrid (Email Service)**

#### **Service Overview**

```yaml
provider: "SendGrid"
primary_use: "Transactional and marketing emails"
cost_model: "Pay-as-you-go with volume discounts"
plan: "Pro plan ($15/month for 100,000 contacts)"
delivery_rate: "99.5%+ inbox placement"
```

#### **Pricing Tiers**

```yaml
free_tier:
  emails_per_day: "100"
  features: ["Basic email sending", "Event webhooks", "Basic analytics"]

pro_plan:
  cost_per_month: "$15"
  emails_per_day: "Unlimited"
  contacts_included: "100,000"
  features:
    - "Advanced analytics"
    - "A/B testing"
    - "Marketing automation"
    - "Dedicated IP addresses (add-on)"
    - "Advanced security features"

premium_plan:
  cost_per_month: "Custom pricing"
  features:
    - "Everything in Pro"
    - "HIPAA compliance"
    - "Advanced security"
    - "Priority support"
    - "Custom contracts"
```

#### **Configuration Example**

```go
// pkg/email/sendgrid.go
package email

import (
    "context"
    "fmt"
    "github.com/sendgrid/sendgrid-go"
    "github.com/sendgrid/sendgrid-go/helpers/mail"
)

type SendGridService struct {
    client *sendgrid.Client
    fromEmail string
    fromName string
}

func NewSendGridService(apiKey, fromEmail, fromName string) *SendGridService {
    client := sendgrid.NewSendClient(apiKey)

    return &SendGridService{
        client:    client,
        fromEmail: fromEmail,
        fromName:  fromName,
    }
}

type EmailRequest struct {
    To          []EmailRecipient `json:"to"`
    Cc          []EmailRecipient `json:"cc,omitempty"`
    Bcc         []EmailRecipient `json:"bcc,omitempty"`
    Subject     string           `json:"subject"`
    Content     string           `json:"content"`
    ContentType string           `json:"content_type"` // "text/html" or "text/plain"
    TemplateID  string           `json:"template_id,omitempty"`
    TemplateData map[string]interface{} `json:"template_data,omitempty"`
    Attachments []EmailAttachment `json:"attachments,omitempty"`
    Categories  []string         `json:"categories,omitempty"`
}

type EmailRecipient struct {
    Email string `json:"email"`
    Name  string `json:"name,omitempty"`
}

type EmailAttachment struct {
    Filename    string `json:"filename"`
    Content     string `json:"content"` // Base64 encoded
    Type        string `json:"type"`
    ContentID   string `json:"content_id,omitempty"`
}

func (s *SendGridService) SendEmail(ctx context.Context, req EmailRequest) error {
    m := mail.NewV3Mail()

    // Set from address
    from := mail.NewEmail(s.fromName, s.fromEmail)
    m.SetFrom(from)

    // Add recipients
    for _, recipient := range req.To {
        personalization := mail.NewPersonalization()
        to := mail.NewEmail(recipient.Name, recipient.Email)
        personalization.AddTos(to)

        // Add CC recipients
        for _, cc := range req.Cc {
            ccEmail := mail.NewEmail(cc.Name, cc.Email)
            personalization.AddCCs(ccEmail)
        }

        // Add BCC recipients
        for _, bcc := range req.Bcc {
            bccEmail := mail.NewEmail(bcc.Name, bcc.Email)
            personalization.AddBCCs(bccEmail)
        }

        // Add template data
        for key, value := range req.TemplateData {
            personalization.SetDynamicTemplateData(key, value)
        }

        m.AddPersonalizations(personalization)
    }

    // Set subject or use template subject
    if req.TemplateID == "" {
        m.Subject = req.Subject
    }

    // Add template or content
    if req.TemplateID != "" {
        m.SetTemplateID(req.TemplateID)
    } else {
        content := mail.NewContent(req.ContentType, req.Content)
        m.AddContent(content)
    }

    // Add attachments
    for _, attachment := range req.Attachments {
        a := mail.NewAttachment()
        a.SetFilename(attachment.Filename)
        a.SetContent(attachment.Content)
        a.SetType(attachment.Type)
        if attachment.ContentID != "" {
            a.SetContentID(attachment.ContentID)
        }
        m.AddAttachment(a)
    }

    // Add categories
    m.SetCategories(req.Categories)

    // Send email
    resp, err := s.client.Send(m)
    if err != nil {
        return fmt.Errorf("failed to send email: %w", err)
    }

    if resp.StatusCode < 200 || resp.StatusCode >= 300 {
        return fmt.Errorf("email send failed with status %d: %s", resp.StatusCode, resp.Body)
    }

    return nil
}

func (s *SendGridService) SendWelcomeEmail(ctx context.Context, userEmail, userName string) error {
    req := EmailRequest{
        To: []EmailRecipient{{
            Email: userEmail,
            Name:  userName,
        }},
        TemplateID: "d-welcome-template-id",
        TemplateData: map[string]interface{}{
            "user_name": userName,
            "login_url": "https://akordium.id/login",
        },
        Categories: []string{"welcome", "onboarding"},
    }

    return s.SendEmail(ctx, req)
}

func (s *SendGridService) SendPaymentConfirmation(ctx context.Context, userEmail, userName string, transaction *Transaction) error {
    req := EmailRequest{
        To: []EmailRecipient{{
            Email: userEmail,
            Name:  userName,
        }},
        TemplateID: "d-payment-confirmation-template-id",
        TemplateData: map[string]interface{}{
            "user_name":    userName,
            "amount":       transaction.Amount,
            "description":  transaction.Description,
            "payment_id":   transaction.ID,
            "payment_date": transaction.PaidAt.Format("2 January 2006"),
        },
        Categories: []string{"payment", "confirmation"},
    }

    return s.SendEmail(ctx, req)
}
```

### **WhatsApp Business API**

#### **Service Overview**

```yaml
provider: "Meta (Facebook) WhatsApp Business API"
primary_use: "Customer notifications and support"
cost_model: "Per-message pricing"
integration: "Direct API integration via official provider"
```

#### **Pricing Structure**

```yaml
message_costs:
  user_initiated:
    marketing: "$0.041 per message"
    utility: "$0.025 per message"
    authentication: "$0.020 per message"
    service: "$0.020 per message"

  business_initiated:
    marketing: "$0.085 per message"
    utility: "$0.041 per message"
    authentication: "$0.025 per message"
    service: "$0.025 per message"

monthly_fees:
  - "WhatsApp Business API access: Free"
  - "Monthly active user fee: Free (up to 1,000 MAU)"
  - "Beyond 1,000 MAU: ~$0.005 per user per month"

conversation_window:
  duration: "24 hours"
  free_messages: "Up to 1,000 free user-initiated messages per month"
```

#### **Integration Example**

```go
// pkg/whatsapp/client.go
package whatsapp

import (
    "bytes"
    "context"
    "encoding/json"
    "fmt"
    "net/http"
    "time"
)

type WhatsAppClient struct {
    accessToken  string
    phoneNumberID string
    baseURL     string
    httpClient  *http.Client
    webhookSecret string
}

type Message struct {
    MessagingProduct string `json:"messaging_product"`
    RecipientType   string `json:"recipient_type"`
    To              string `json:"to"`
    Type            string `json:"type"`
    Text            *TextMessage     `json:"text,omitempty"`
    Template        *TemplateMessage `json:"template,omitempty"`
}

type TextMessage struct {
    Body string `json:"body"`
}

type TemplateMessage struct {
    Name       string                 `json:"name"`
    Language   TemplateLanguage       `json:"language"`
    Components []TemplateComponent    `json:"components"`
}

type TemplateLanguage struct {
    Code string `json:"code"`
}

type TemplateComponent struct {
    Type       string              `json:"type"`
    Parameters []TemplateParameter `json:"parameters"`
}

type TemplateParameter struct {
    Type    string `json:"type"`
    Text    string `json:"text,omitempty"`
    Currency *Currency `json:"currency,omitempty"`
}

type Currency struct {
    Code        string  `json:"code"`
    Amount      float64 `json:"amount_1000"`
    Fallback    string  `json:"fallback_value"`
}

func NewWhatsAppClient(accessToken, phoneNumberID, webhookSecret string) *WhatsAppClient {
    return &WhatsAppClient{
        accessToken:   accessToken,
        phoneNumberID: phoneNumberID,
        baseURL:       "https://graph.facebook.com/v18.0",
        webhookSecret: webhookSecret,
        httpClient: &http.Client{
            Timeout: 30 * time.Second,
        },
    }
}

func (w *WhatsAppClient) SendTextMessage(ctx context.Context, recipient, message string) error {
    msg := Message{
        MessagingProduct: "whatsapp",
        RecipientType:    "individual",
        To:               recipient,
        Type:             "text",
        Text: &TextMessage{
            Body: message,
        },
    }

    return w.sendMessage(ctx, msg)
}

func (w *WhatsAppClient) SendTemplateMessage(ctx context.Context, recipient, templateName string, parameters []map[string]interface{}) error {
    components := make([]TemplateComponent, 0)

    for _, param := range parameters {
        templateParam := TemplateParameter{
            Type: "text",
        }

        if text, ok := param["text"].(string); ok {
            templateParam.Text = text
        }

        if currency, ok := param["currency"].(map[string]interface{}); ok {
            templateParam.Type = "currency"
            templateParam.Currency = &Currency{
                Code:     currency["code"].(string),
                Amount:   currency["amount"].(float64),
                Fallback: currency["fallback"].(string),
            }
        }

        components = append(components, TemplateComponent{
            Type:       "body",
            Parameters: []TemplateParameter{templateParam},
        })
    }

    msg := Message{
        MessagingProduct: "whatsapp",
        RecipientType:    "individual",
        To:               recipient,
        Type:             "template",
        Template: &TemplateMessage{
            Name:     templateName,
            Language: TemplateLanguage{Code: "id"}, // Indonesian
            Components: components,
        },
    }

    return w.sendMessage(ctx, msg)
}

func (w *WhatsAppClient) sendMessage(ctx context.Context, msg Message) error {
    url := fmt.Sprintf("%s/%s/messages", w.baseURL, w.phoneNumberID)

    payload, err := json.Marshal(msg)
    if err != nil {
        return fmt.Errorf("failed to marshal message: %w", err)
    }

    req, err := http.NewRequestWithContext(ctx, "POST", url, bytes.NewBuffer(payload))
    if err != nil {
        return fmt.Errorf("failed to create request: %w", err)
    }

    req.Header.Set("Content-Type", "application/json")
    req.Header.Set("Authorization", "Bearer "+w.accessToken)

    resp, err := w.httpClient.Do(req)
    if err != nil {
        return fmt.Errorf("failed to send request: %w", err)
    }
    defer resp.Body.Close()

    if resp.StatusCode >= 400 {
        return fmt.Errorf("WhatsApp API error: status %d", resp.StatusCode)
    }

    return nil
}

func (w *WhatsAppClient) SendPaymentConfirmation(ctx context.Context, recipient string, amount float64, orderID string) error {
    templateName := "payment_confirmation"
    parameters := []map[string]interface{}{
        {
            "text": fmt.Sprintf("Rp %.2f", amount),
        },
        {
            "text": orderID,
        },
        {
            "text": time.Now().Format("2 January 2006"),
        },
    }

    return w.SendTemplateMessage(ctx, recipient, templateName, parameters)
}

func (w *WhatsAppClient) SendOrderStatusUpdate(ctx context.Context, recipient, status string, orderID string) error {
    templateName := "order_status_update"
    parameters := []map[string]interface{}{
        {
            "text": status,
        },
        {
            "text": orderID,
        },
    }

    return w.SendTemplateMessage(ctx, recipient, templateName, parameters)
}
```

## 📊 Analytics & Monitoring Services

### **Sentry (Error Monitoring)**

#### **Service Overview**

```yaml
provider: "Sentry"
primary_use: "Error tracking and performance monitoring"
cost_model: "Usage-based pricing"
plan: "Team plan ($26/user/month)"
```

#### **Pricing Tiers**

```yaml
free_tier:
  errors_per_month: "5,000"
  performance_units: "10,000"
  team_seats: "1"
  features: ["Basic error tracking", "Basic performance"]

team_plan:
  cost_per_user_month: "$26"
  errors_per_month: "100,000"
  performance_units: "500,000"
  team_seats: "Unlimited"
  features:
    - "Advanced error tracking"
    - "Performance monitoring"
    - "Source maps"
    - "Release tracking"
    - "Custom alerts"
    - "Data retention (90 days)"

business_plan:
  cost_per_user_month: "$80"
  features:
    - "Everything in Team"
    - "Unlimited errors and performance"
    - "Extended data retention (2 years)"
    - "Advanced compliance features"
    - "Priority support"
```

#### **Configuration Example**

```go
// pkg/monitoring/sentry.go
package monitoring

import (
    "context"
    "fmt"
    "runtime/debug"

    "github.com/getsentry/sentry-go"
)

type SentryConfig struct {
    DSN              string
    Environment      string
    Release          string
    SampleRate       float64
    TracesSampleRate float64
}

type SentryService struct {
    hub *sentry.Hub
}

func NewSentryService(config SentryConfig) (*SentryService, error) {
    err := sentry.Init(sentry.ClientOptions{
        Dsn:              config.DSN,
        Environment:      config.Environment,
        Release:          config.Release,
        SampleRate:       config.SampleRate,
        TracesSampleRate: config.TracesSampleRate,
        BeforeSend: func(event *sentry.Event, hint *sentry.EventHint) *sentry.Event {
            // Filter out sensitive data
            if event.Request != nil {
                // Remove sensitive headers
                if event.Request.Headers != nil {
                    delete(event.Request.Headers, "Authorization")
                    delete(event.Request.Headers, "Cookie")
                }
            }

            // Add custom context
            if event.Contexts == nil {
                event.Contexts = make(map[string]interface{})
            }

            event.Contexts["runtime"] = map[string]interface{}{
                "go_version": runtime.Version(),
                "os":         runtime.GOOS,
                "arch":       runtime.GOARCH,
            }

            return event
        },
        BeforeBreadcrumb: func(breadcrumb *sentry.Breadcrumb, hint *sentry.BreadcrumbHint) *sentry.Breadcrumb {
            // Filter out sensitive breadcrumb data
            if breadcrumb.Category == "http" && breadcrumb.Data != nil {
                delete(breadcrumb.Data, "Authorization")
                delete(breadcrumb.Data, "Cookie")
            }
            return breadcrumb
        },
    })

    if err != nil {
        return nil, fmt.Errorf("failed to initialize Sentry: %w", err)
    }

    hub := sentry.CurrentHub()

    return &SentryService{hub: hub}, nil
}

func (s *SentryService) CaptureException(ctx context.Context, err error, tags map[string]string, extra map[string]interface{}) {
    if err == nil {
        return
    }

    // Add context from request if available
    scope := s.hub.Scope()

    // Add tags
    for k, v := range tags {
        scope.SetTag(k, v)
    }

    // Add extra data
    for k, v := range extra {
        scope.SetExtra(k, v)
    }

    // Add user context if available in context
    if userID := ctx.Value("user_id"); userID != nil {
        scope.SetUser(sentry.User{
            ID: fmt.Sprintf("%v", userID),
        })
    }

    // Add request context if available
    if requestID := ctx.Value("request_id"); requestID != nil {
        scope.SetTag("request_id", fmt.Sprintf("%v", requestID))
    }

    s.hub.CaptureException(err)
}

func (s *SentryService) CaptureMessage(ctx context.Context, message string, level sentry.Level, tags map[string]string, extra map[string]interface{}) {
    scope := s.hub.Scope()

    for k, v := range tags {
        scope.SetTag(k, v)
    }

    for k, v := range extra {
        scope.SetExtra(k, v)
    }

    s.hub.CaptureMessage(message, level)
}

func (s *SentryService) AddBreadcrumb(ctx context.Context, category, message string, level sentry.Level, data map[string]interface{}) {
    breadcrumb := &sentry.Breadcrumb{
        Category: category,
        Message:  message,
        Level:    level,
        Data:     data,
        Timestamp: time.Now(),
    }

    s.hub.Scope().AddBreadcrumb(breadcrumb, 100) // Max 100 breadcrumbs
}

func (s *SentryService) SetUser(ctx context.Context, userID, email, username string) {
    user := sentry.User{
        ID:       userID,
        Email:    email,
        Username: username,
    }

    s.hub.Scope().SetUser(user)
}

func (s *SentryService) SetTransaction(ctx context.Context, name string) {
    s.hub.Scope().SetTransaction(name)
}

func (s *SentryService) Flush(timeout time.Duration) {
    s.hub.Flush(timeout)
}

// Middleware for HTTP frameworks
func (s *SentryService) HTTPMiddleware(next http.Handler) http.Handler {
    return sentryhttp.New(sentryhttp.Options{
        Repanic:         true,
        WaitForDelivery: false,
        Timeout:         5 * time.Second,
    }).Handle(next)
}
```

### **Google Analytics 4**

#### **Service Overview**

```yaml
provider: "Google Analytics"
primary_use: "Web analytics and user behavior tracking"
cost_model: "Free tier + Google Analytics 360"
plan: "Standard (free)"
```

#### **Configuration Example**

```javascript
// frontend/src/lib/analytics.js
export class AnalyticsService {
    constructor(measurementId, apiKey = null) {
        this.measurementId = measurementId;
        this.apiKey = apiKey;
        this.init();
    }

    init() {
        // Initialize gtag
        window.dataLayer = window.dataLayer || [];
        window.gtag = function gtag() {
            window.dataLayer.push(arguments);
        };

        gtag('js', new Date());
        gtag('config', this.measurementId, {
            send_page_view: false, // We'll handle page views manually
            debug_mode: process.env.NODE_ENV === 'development'
        });
    }

    trackPageView(pagePath, pageTitle = null) {
        gtag('config', this.measurementId, {
            page_path: pagePath,
            page_title: pageTitle
        });
    }

    trackEvent(eventName, parameters = {}) {
        gtag('event', eventName, {
            ...parameters,
            custom_map: {
                custom_parameter_1: 'user_type',
                custom_parameter_2: 'subscription_tier'
            }
        });
    }

    trackUserSignUp(userId, method) {
        this.trackEvent('sign_up', {
            method: method,
            user_id: userId
        });
    }

    trackPurchase(transactionId, value, currency, items = []) {
        this.trackEvent('purchase', {
            transaction_id: transactionId,
            value: value,
            currency: currency,
            items: items.map(item => ({
                item_id: item.id,
                item_name: item.name,
                category: item.category,
                quantity: item.quantity,
                price: item.price
            }))
        });
    }

    trackPaymentStart(amount, paymentMethod) {
        this.trackEvent('begin_checkout', {
            value: amount,
            currency: 'IDR',
            payment_method: paymentMethod
        });
    }

    trackWaqfDonation(projectId, amount) {
        this.trackEvent('waqf_donation', {
            project_id: projectId,
            value: amount,
            currency: 'IDR'
        });
    }

    // E-commerce tracking
    trackViewItem(itemId, itemName, category, price) {
        this.trackEvent('view_item', {
            item_id: itemId,
            item_name: itemName,
            item_category: category,
            price: price
        });
    }

    trackAddToCart(itemId, itemName, category, price, quantity) {
        this.trackEvent('add_to_cart', {
            item_id: itemId,
            item_name: itemName,
            item_category: category,
            price: price,
            quantity: quantity
        });
    }

    // Custom events
    trackFeatureUsage(featureName) {
        this.trackEvent('feature_usage', {
            feature_name: featureName
        });
    }

    trackError(errorType, errorMessage, errorContext = {}) {
        this.trackEvent('error', {
            error_type: errorType,
            error_message: errorMessage,
            ...errorContext
        });
    }

    // User engagement
    trackSessionDuration(duration) {
        this.trackEvent('session_duration', {
            duration_seconds: duration
        });
    }

    // Custom dimension tracking
    setUserType(userType) {
        gtag('config', this.measurementId, {
            custom_parameter_1: userType
        });
    }

    setSubscriptionTier(tier) {
        gtag('config', this.measurementId, {
            custom_parameter_2: tier
        });
    }
}

// Usage example:
const analytics = new AnalyticsService('G-XXXXXXXXXX');

// Track page views
analytics.trackPageView('/dashboard', 'Dashboard');

// Track custom events
analytics.trackWaqfDonation('project-123', 1000000);
analytics.trackFeatureUsage('payment_qr');
```

## 💰 Cost Optimization Strategies

### **Monthly Cost Breakdown**

```yaml
infrastructure:
  oracle_cloud:
    - "Compute (3x VM): $150/month"
    - "Load Balancer: $25/month"
    - "Storage (1TB): $25/month"
    - "Network: $20/month"
    total: "$220/month"

  cloudflare:
    - "Pro Plan: $20/month"
    - "R2 Storage (500GB): $7.50/month"
    - "Bandwidth: Free"
    total: "$27.50/month"

payment_gateways:
  midtrans: "Transaction fees (estimated 2% of revenue)"
  xendit: "Fallback (minimal usage)"

communication:
  sendgrid: "$15/month (Pro Plan)"
  whatsapp: "~$50/month (estimated 1,000 messages)"

monitoring:
  sentry: "$156/month (6 developers x $26)"
  google_analytics: "Free"

total_estimated_monthly: "~$470 + payment processing fees"
```

### **Optimization Strategies**

```yaml
cloud_infrastructure:
  - "Use ARM-based instances for cost savings"
  - "Implement auto-scaling for variable workloads"
  - "Use spot instances for non-critical workloads"
  - "Optimize storage with lifecycle policies"
  - "Monitor and right-size resources monthly"

payment_processing:
  - "Negotiate volume discounts with payment providers"
  - "Use local bank transfers for lower fees"
  - "Implement smart payment routing for cost optimization"
  - "Monitor transaction success rates to minimize failed payment costs"

email_communication:
  - "Implement email batching to reduce API calls"
  - "Use templates to minimize storage"
  - "Monitor bounce rates to maintain good deliverability"
  - "Segment users for targeted campaigns"

monitoring:
  - "Set up intelligent sampling for high-traffic applications"
  - "Use alerts to quickly identify and fix issues"
  - "Regular performance reviews to optimize sampling rates"
  - "Archive old data to reduce storage costs"
```

## 🔄 Service Dependencies & Redundancy

### **Critical Service Mapping**

```yaml
primary_services:
  core_functionality:
    - "OCI Compute (Application hosting)"
    - "PostgreSQL Database (Data storage)"
    - "Redis (Caching & sessions)"

  payments:
    primary: "Midtrans"
    fallback: "Xendit"
    manual: "Bank transfer confirmation"

  communications:
    primary: "SendGrid"
    backup: "Local SMTP (emergency)"
    fallback: "WhatsApp Business API"

  analytics:
    primary: "Sentry (Error tracking)"
    secondary: "Google Analytics"
    internal: "Custom analytics"

redundancy_strategies:
  database:
    - "Primary-replica setup"
    - "Daily backups to multiple locations"
    - "Point-in-time recovery capability"

  application:
    - "Multi-instance deployment"
    - "Load balancer health checks"
    - "Blue-green deployment strategy"

  external_apis:
    - "Multiple payment gateways"
    - "Circuit breaker patterns"
    - "Graceful degradation capabilities"
```

### **Service Health Monitoring**

```go
// pkg/health/monitor.go
package health

import (
    "context"
    "fmt"
    "net/http"
    "time"
)

type HealthChecker interface {
    CheckHealth(ctx context.Context) HealthResult
}

type HealthResult struct {
    Status    HealthStatus `json:"status"`
    Message   string       `json:"message,omitempty"`
    Duration  time.Duration `json:"duration"`
    Timestamp time.Time    `json:"timestamp"`
}

type HealthStatus string

const (
    StatusHealthy   HealthStatus = "healthy"
    StatusUnhealthy HealthStatus = "unhealthy"
    StatusDegraded  HealthStatus = "degraded"
)

type ServiceMonitor struct {
    checkers map[string]HealthChecker
    timeout  time.Duration
}

func NewServiceMonitor(timeout time.Duration) *ServiceMonitor {
    return &ServiceMonitor{
        checkers: make(map[string]HealthChecker),
        timeout:  timeout,
    }
}

func (sm *ServiceMonitor) RegisterChecker(name string, checker HealthChecker) {
    sm.checkers[name] = checker
}

func (sm *ServiceMonitor) CheckAll(ctx context.Context) map[string]HealthResult {
    results := make(map[string]HealthResult)

    for name, checker := range sm.checkers {
        ctx, cancel := context.WithTimeout(ctx, sm.timeout)
        result := checker.CheckHealth(ctx)
        cancel()

        results[name] = result
    }

    return results
}

// Database Health Checker
type DatabaseHealthChecker struct {
    db *sql.DB
}

func NewDatabaseHealthChecker(db *sql.DB) *DatabaseHealthChecker {
    return &DatabaseHealthChecker{db: db}
}

func (dhc *DatabaseHealthChecker) CheckHealth(ctx context.Context) HealthResult {
    start := time.Now()

    err := dhc.db.PingContext(ctx)
    duration := time.Since(start)

    if err != nil {
        return HealthResult{
            Status:    StatusUnhealthy,
            Message:   fmt.Sprintf("Database ping failed: %v", err),
            Duration:  duration,
            Timestamp: time.Now(),
        }
    }

    // Check if there are any active connections
    stats := dhc.db.Stats()
    if stats.OpenConnections == 0 {
        return HealthResult{
            Status:    StatusDegraded,
            Message:   "No open database connections",
            Duration:  duration,
            Timestamp: time.Now(),
        }
    }

    return HealthResult{
        Status:    StatusHealthy,
        Duration:  duration,
        Timestamp: time.Now(),
    }
}

// External API Health Checker
type ExternalAPIHealthChecker struct {
    client  *http.Client
    baseURL string
    apiKey  string
}

func NewExternalAPIHealthChecker(baseURL, apiKey string) *ExternalAPIHealthChecker {
    return &ExternalAPIHealthChecker{
        client: &http.Client{
            Timeout: 10 * time.Second,
        },
        baseURL: baseURL,
        apiKey:  apiKey,
    }
}

func (eac *ExternalAPIHealthChecker) CheckHealth(ctx context.Context) HealthResult {
    start := time.Now()

    req, err := http.NewRequestWithContext(ctx, "GET", eac.baseURL+"/health", nil)
    if err != nil {
        return HealthResult{
            Status:    StatusUnhealthy,
            Message:   fmt.Sprintf("Failed to create request: %v", err),
            Duration:  time.Since(start),
            Timestamp: time.Now(),
        }
    }

    if eac.apiKey != "" {
        req.Header.Set("Authorization", "Bearer "+eac.apiKey)
    }

    resp, err := eac.client.Do(req)
    duration := time.Since(start)

    if err != nil {
        return HealthResult{
            Status:    StatusUnhealthy,
            Message:   fmt.Sprintf("API request failed: %v", err),
            Duration:  duration,
            Timestamp: time.Now(),
        }
    }
    defer resp.Body.Close()

    if resp.StatusCode >= 200 && resp.StatusCode < 300 {
        return HealthResult{
            Status:    StatusHealthy,
            Duration:  duration,
            Timestamp: time.Now(),
        }
    }

    return HealthResult{
        Status:    StatusUnhealthy,
        Message:   fmt.Sprintf("API returned status %d", resp.StatusCode),
        Duration:  duration,
        Timestamp: time.Now(),
    }
}
```

---

**Third-Party Service Management:**

- **Regular Review:** Evaluate service performance dan costs quarterly
- **Backup Plans:** Always have fallback options untuk critical services
- **Monitoring:** Comprehensive monitoring untuk semua external dependencies
- **Security:** Regular security reviews untuk semua integrations
- **Documentation:** Keep integration details updated
- **Cost Control:** Monitor usage dan optimize costs regularly

*Related Documentation:* [API Guidelines](./api-design-guidelines.md) | [Security Practices](../01-SOP/security-practices.md) | [Monitoring & Logging](./monitoring-logging.md) | [Backup & Recovery](./backup-recovery.md)
