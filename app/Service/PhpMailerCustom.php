<?php 

namespace App\Service;
use Illuminate\Support\Facades\Storage;
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;
/**
 * 
 */
class PhpMailerCustom
{
    public $email_to;
    public $subject;
    protected $connect;
    public function __construct(){


    }
	public function init_email($view,$data = array()){

        try {
            //Recipients

            $mail = new PHPMailer(true);
            //$mail->SMTPDebug = SMTP::DEBUG_SERVER;                      // Enable verbose debug output
            $mail->isSMTP();                                            // Send using SMTP
            $mail->Host       = config('mail.mailers.smtp.host');                    // Set the SMTP server to send through
            $mail->SMTPAuth   = true;                                   // Enable SMTP authentication
            $mail->Username   = config('mail.mailers.smtp.username'); // config('phpmailer.username')
            $mail->Password   = config('mail.mailers.smtp.password');    //config('phpmailer.password')
            $mail->SMTPSecure = config('mail.mailers.smtp.encryption'); //config('phpmailer.encryption')        // Enable TLS encryption; `PHPMailer::ENCRYPTION_SMTPS` encouraged
            $mail->Port       = config('mail.mailers.smtp.port'); //config('phpmailer.port')                                   // TCP port to connect to, use 465 for `PHPMailer::ENCRYPTION_SMTPS` above
     
            $mail->setFrom(config('mail.from.address'),config('mail.from.name'));
            $mail->addAddress($this->email_to);     // Add a recipient

            $mail->isHTML(true);                                  
            $mail->CharSet = 'UTF-8';

            $mail->Subject = $this->subject;
            if (!empty($data) OR count($data) > 0) {
                $mail->Body  = view($view,$data);
            }else{
                $mail->Body  = view($view);
            }
            $mail->send();
            $mail->clearAddresses();
            return true;
            
        } catch (Exception $e) {
            return "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
        }
	}

}