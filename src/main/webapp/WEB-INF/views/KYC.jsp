<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cinevestor | KYC Verification</title>
    <link rel="icon" type="image/x-icon" href="favicon.ico">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-dark: #0f0e17;
            --primary-light: #fffffe;
            --filmmaker-orange: #ff8906;
            --investor-pink: #e53170;
            --studio-blue: #3da9fc;
            --success-green: #2ecc71;
            --pending-yellow: #f1c40f;
            --gradient: linear-gradient(135deg, var(--filmmaker-orange), var(--investor-pink));
            --glass: rgba(255, 255, 255, 0.08);
            --sidebar-width: 280px;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background-color: var(--primary-dark);
            color: var(--primary-light);
            background-image: 
                radial-gradient(circle at 20% 30%, rgba(255, 137, 6, 0.1) 0%, transparent 30%),
                radial-gradient(circle at 80% 70%, rgba(229, 49, 112, 0.1) 0%, transparent 30%);
            min-height: 100vh;
            display: flex;
        }

        .sidebar {
            width: var(--sidebar-width);
            background: rgba(15, 14, 23, 0.85);
            padding: 2rem 1.5rem;
            border-right: 1px solid rgba(255, 137, 6, 0.2);
            height: 100vh;
            position: fixed;
        }

        .main-content {
            margin-left: var(--sidebar-width);
            padding: 2.5rem;
            width: calc(100% - var(--sidebar-width));
        }

        /* Cinematic Animations */
        @keyframes filmReelSpin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }

        @keyframes shimmer {
            0% { background-position: -1000px 0; }
            100% { background-position: 1000px 0; }
        }

        @keyframes slideIn {
            from { transform: translateX(-20px); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
        }

        @keyframes ripple {
            to {
                transform: scale(4);
                opacity: 0;
            }
        }

        @keyframes spotlight {
            0% { box-shadow: 0 0 0 0 rgba(61, 169, 252, 0.4); }
            100% { box-shadow: 0 0 20px 10px rgba(61, 169, 252, 0); }
        }

        .kyc-container {
            max-width: 900px;
            margin: 2rem auto;
            background: rgba(31, 27, 58, 0.6);
            border-radius: 16px;
            padding: 2.5rem;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 137, 6, 0.2);
            animation: fadeIn 0.6s ease-out;
            position: relative;
            overflow: hidden;
        }

        .kyc-container::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,137,6,0.05) 0%, rgba(31,27,58,0) 70%);
            animation: filmReelSpin 20s linear infinite;
            pointer-events: none;
            z-index: -1;
        }

        .kyc-header {
            text-align: center;
            margin-bottom: 3rem;
            position: relative;
        }

        .kyc-title {
            font-size: 2.5rem;
            margin-bottom: 0.5rem;
            background: linear-gradient(to right, var(--filmmaker-orange), var(--investor-pink));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            animation: shimmer 3s linear infinite;
            background-size: 200% auto;
            position: relative;
            display: inline-block;
        }

        .kyc-title::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 0;
            width: 100%;
            height: 3px;
            background: var(--gradient);
            border-radius: 3px;
            transform: scaleX(0);
            transform-origin: left;
            transition: transform 0.5s ease;
        }

        .kyc-title:hover::after {
            transform: scaleX(1);
        }

        .kyc-subtitle {
            color: var(--primary-light);
            opacity: 0.8;
            font-size: 1.1rem;
            max-width: 600px;
            margin: 0 auto;
            line-height: 1.6;
        }

        /* Progress Tracker */
        .progress-tracker {
            display: flex;
            justify-content: space-between;
            position: relative;
            margin-bottom: 3rem;
        }

        .progress-line {
            position: absolute;
            top: 25px;
            left: 0;
            right: 0;
            height: 6px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 3px;
            z-index: 1;
        }

        .progress-fill {
            position: absolute;
            top: 25px;
            left: 0;
            height: 6px;
            background: var(--gradient);
            border-radius: 3px;
            z-index: 2;
            transition: width 0.5s ease;
            box-shadow: 0 0 10px rgba(229, 49, 112, 0.3);
        }

        .progress-steps {
            display: flex;
            justify-content: space-between;
            width: 100%;
            position: relative;
            z-index: 3;
        }

        .progress-step {
            display: flex;
            flex-direction: column;
            align-items: center;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .progress-step:hover .step-number {
            transform: scale(1.1);
        }

        .step-number {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background: var(--primary-dark);
            border: 3px solid rgba(255, 255, 255, 0.1);
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
            font-size: 1.2rem;
            margin-bottom: 0.8rem;
            transition: all 0.3s ease;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            position: relative;
            overflow: hidden;
        }

        .step-number::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: var(--gradient);
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .progress-step:hover .step-number::before {
            opacity: 0.1;
        }

        .progress-step.active .step-number {
            border-color: var(--studio-blue);
            background: var(--studio-blue);
            color: var(--primary-dark);
            transform: scale(1.1);
            animation: pulse 2s infinite;
        }

        .progress-step.completed .step-number {
            border-color: var(--success-green);
            background: var(--success-green);
            color: var(--primary-dark);
            box-shadow: 0 0 15px rgba(46, 204, 113, 0.4);
        }

        .progress-step.completed .step-number i {
            display: block;
        }

        .progress-step.completed .step-number span {
            display: none;
        }

        .step-number i {
            display: none;
            font-size: 1.2rem;
            position: relative;
            z-index: 2;
        }

        .step-label {
            font-size: 1rem;
            font-weight: 500;
            text-align: center;
            background: rgba(255, 255, 255, 0.05);
            padding: 0.5rem 1rem;
            border-radius: 20px;
            transition: all 0.3s ease;
        }

        .progress-step.active .step-label {
            background: rgba(61, 169, 252, 0.2);
            color: var(--studio-blue);
        }

        .progress-step.completed .step-label {
            background: rgba(46, 204, 113, 0.2);
            color: var(--success-green);
        }

        /* Verification Steps Content */
        .verification-content {
            margin-top: 2rem;
            animation: slideIn 0.5s ease-out;
        }

        .step-content {
            display: none;
            animation: fadeIn 0.5s ease;
        }

        .step-content.active {
            display: block;
        }

        .step-title {
            font-size: 1.8rem;
            margin-bottom: 0.5rem;
            color: var(--primary-light);
            display: flex;
            align-items: center;
            position: relative;
        }

        .step-title i {
            margin-right: 1rem;
            color: var(--filmmaker-orange);
            animation: float 3s ease-in-out infinite;
        }

        .step-description {
            color: var(--primary-light);
            opacity: 0.8;
            margin-bottom: 2rem;
            font-size: 1.1rem;
            line-height: 1.6;
        }

        /* Form Styles */
        .kyc-form {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1.5rem;
            margin-top: 1.5rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
            position: relative;
        }

        .form-group.full-width {
            grid-column: span 2;
        }

        label {
            display: block;
            margin-bottom: 0.8rem;
            font-size: 0.95rem;
            color: var(--primary-light);
            opacity: 0.9;
        }

        input, select {
            width: 100%;
            padding: 1rem 1.2rem;
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 8px;
            color: var(--primary-light);
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        input:focus, select:focus {
            outline: none;
            border-color: var(--studio-blue);
            box-shadow: 0 0 0 3px rgba(61, 169, 252, 0.2);
            background: rgba(61, 169, 252, 0.05);
        }

        .form-actions {
            grid-column: span 2;
            display: flex;
            justify-content: flex-end;
            margin-top: 1rem;
            gap: 1rem;
        }

        .btn {
            padding: 1rem 2rem;
            border-radius: 8px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            border: none;
            display: flex;
            align-items: center;
            justify-content: center;
            min-width: 150px;
            position: relative;
            overflow: hidden;
        }

        .btn i {
            margin-right: 0.5rem;
        }

        .btn-primary {
            background: var(--gradient);
            color: white;
            box-shadow: 0 4px 15px rgba(229, 49, 112, 0.3);
        }

        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(229, 49, 112, 0.4);
            animation: pulse 1.5s infinite;
        }

        .btn-outline {
            background: transparent;
            color: var(--studio-blue);
            border: 1px solid var(--studio-blue);
        }

        .btn-outline:hover {
            background: rgba(61, 169, 252, 0.1);
            transform: translateY(-3px);
        }

        .ripple {
            position: absolute;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.4);
            transform: scale(0);
            animation: ripple 0.6s linear;
            pointer-events: none;
        }

        /* Document Upload */
        .document-section {
            grid-column: span 2;
            margin: 1rem 0 2rem;
        }

        .document-card {
            background: rgba(20, 18, 40, 0.8);
            border-radius: 12px;
            padding: 1.5rem;
            border: 1px solid rgba(255, 137, 6, 0.2);
            margin-bottom: 1.5rem;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .document-card:hover {
            border-color: var(--studio-blue);
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
        }

        .document-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, rgba(255,137,6,0.05) 0%, rgba(229,49,112,0.05) 100%);
            opacity: 0;
            transition: opacity 0.3s ease;
            pointer-events: none;
        }

        .document-card:hover::before {
            opacity: 1;
        }

        .document-header {
            display: flex;
            align-items: center;
            margin-bottom: 1.5rem;
        }

        .document-icon {
            width: 50px;
            height: 50px;
            border-radius: 12px;
            background: rgba(61, 169, 252, 0.1);
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 1.5rem;
            color: var(--studio-blue);
            font-size: 1.5rem;
            transition: all 0.3s ease;
            margin-top: -20px;
        }
        
     
        .document-card:hover .document-icon {
            transform: rotate(15deg);
            background: var(--gradient);
            color: white;
        }

        .document-title {
            font-size: 1.2rem;
            font-weight: 500;
            margin-bottom: 0.3rem;
            color: var(--primary-light);
        }

        .document-subtitle {
            color: var(--primary-light);
            opacity: 0.7;
            font-size: 0.9rem;
        }

        .verify-btn {
            margin-top: 1rem;
            padding: 0.8rem 1.5rem;
            background: rgba(46, 204, 113, 0.1);
            color: var(--success-green);
            border: 1px solid var(--success-green);
            border-radius: 8px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }

        .verify-btn:hover {
            background: rgba(46, 204, 113, 0.2);
            transform: translateY(-2px);
        }

        .verify-btn i {
            margin-right: 0.5rem;
        }

        .verification-status {
            display: flex;
            align-items: center;
            margin-top: 1rem;
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-size: 0.9rem;
            font-weight: 500;
        }

        .status-pending {
            background: rgba(241, 196, 15, 0.1);
            color: var(--pending-yellow);
        }

        .status-verified {
            background: rgba(46, 204, 113, 0.1);
            color: var(--success-green);
        }

        .status-icon {
            margin-right: 0.5rem;
        }

        .id-preview {
            display: flex;
            align-items: center;
            margin-top: 2rem;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 12px;
            padding: 1.5rem;
            border: 1px dashed rgba(255, 137, 6, 0.3);
            transition: all 0.3s ease;
        }

        .id-preview:hover {
            border-color: var(--studio-blue);
            background: rgba(61, 169, 252, 0.05);
        }

        .id-logo {
            width: 80px;
            height: 80px;
            background: rgba(255, 137, 6, 0.1);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 1.5rem;
            color: var(--filmmaker-orange);
            font-size: 2rem;
            transition: all 0.3s ease;
        }

        .id-preview:hover .id-logo {
            background: var(--gradient);
            color: white;
            transform: rotate(15deg);
        }

        .id-details {
            flex: 1;
        }

        .id-number-input {
            margin-top: 1rem;
        }

        .id-number-input input {
            background: rgba(255, 255, 255, 0.1);
            font-size: 1.1rem;
            letter-spacing: 1px;
            text-align: center;
            font-weight: 500;
        }

        .file-input {
            display: none;
        }

        .file-label {
            padding: 0.8rem 1.5rem;
            background: rgba(61, 169, 252, 0.1);
            color: var(--studio-blue);
            border: 1px solid var(--studio-blue);
            border-radius: 8px;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            transition: all 0.3s ease;
        }

        .file-label:hover {
            background: rgba(61, 169, 252, 0.2);
            transform: translateY(-2px);
        }

        .file-label i {
            margin-right: 0.5rem;
        }

        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(15, 14, 23, 0.9);
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 1000;
            opacity: 0;
            visibility: hidden;
            transition: all 0.3s ease;
        }

        .modal-overlay.active {
            opacity: 1;
            visibility: visible;
        }

        .modal-content {
            background: rgba(31, 27, 58, 0.95);
            border-radius: 16px;
            padding: 3rem;
            text-align: center;
            max-width: 500px;
            width: 90%;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
            border: 1px solid var(--filmmaker-orange);
            transform: scale(0.9);
            opacity: 0;
            transition: all 0.3s ease;
        }

        .modal-overlay.active .modal-content {
            transform: scale(1);
            opacity: 1;
        }

        .modal-icon {
            font-size: 4rem;
            color: var(--success-green);
            margin-bottom: 1.5rem;
            animation: float 3s ease-in-out infinite;
        }

        .modal-title {
            font-size: 2rem;
            margin-bottom: 1rem;
            background: linear-gradient(to right, var(--success-green), var(--studio-blue));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .modal-text {
            color: var(--primary-light);
            opacity: 0.8;
            margin-bottom: 2rem;
            line-height: 1.6;
        }

        .modal-btn {
            padding: 1rem 2rem;
            background: var(--gradient);
            color: white;
            border: none;
            border-radius: 8px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-width: 200px;
        }

        .modal-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(229, 49, 112, 0.4);
        }

        .modal-btn i {
            margin-right: 0.5rem;
        }

        #message {
            padding: 1rem;
            margin: 1rem 0;
            border-radius: 8px;
            text-align: center;
            display: none;
        }

        #timer {
            animation: pulse 1.5s infinite;
        }

        @media (max-width: 768px) {
            .kyc-container {
                padding: 1.5rem;
                margin: 1rem;
            }

            .kyc-title {
                font-size: 2rem;
            }

            .kyc-form {
                grid-template-columns: 1fr;
            }

            .form-group.full-width {
                grid-column: span 1;
            }

            .form-actions {
                grid-column: span 1;
                flex-direction: column;
            }

            .btn {
                width: 100%;
                margin-bottom: 1rem;
            }

            .progress-step {
                flex: 1;
            }

            .step-label {
                font-size: 0.8rem;
                padding: 0.3rem 0.5rem;
            }

            .id-preview {
                flex-direction: column;
                text-align: center;
            }

            .id-logo {
                margin-right: 0;
                margin-bottom: 1rem;
            }
        }
    </style>
</head>
<body>
    <%@ include file="header.jsp"%>

    <div class="main-content">
        <div class="kyc-container">
            <div class="kyc-header">
                <h1 class="kyc-title">KYC Verification</h1>
                <p class="kyc-subtitle">Complete your verification to unlock all investment opportunities and access exclusive filmmaker projects</p>
            </div>

            <div class="progress-tracker">
                <div class="progress-line"></div>
                <div class="progress-fill" style="width: 0%"></div>
                <div class="progress-steps">
                    <div class="progress-step active" data-step="1">
                        <div class="step-number"><span>1</span><i class="fas fa-check"></i></div>
                        <div class="step-label">Personal Info</div>
                    </div>
                    <div class="progress-step" data-step="2">
                        <div class="step-number"><span>2</span><i class="fas fa-check"></i></div>
                        <div class="step-label">Identity</div>
                    </div>
                    <div class="progress-step" data-step="3">
                        <div class="step-number"><span>3</span><i class="fas fa-check"></i></div>
                        <div class="step-label">Address</div>
                    </div>
                    <div class="progress-step" data-step="4">
                        <div class="step-number"><span>4</span><i class="fas fa-check"></i></div>
                        <div class="step-label">Financial</div>
                    </div>
                </div>
            </div>

            <div class="verification-content">
                <div class="step-content active" data-step="1">
                    <h3 class="step-title"><i class="fas fa-user"></i> Personal Information</h3>
                    <p class="step-description">Let's start with your basic personal details to create your investor profile</p>
                    <form class="kyc-form" id="personalForm">
                        <div class="form-group">
                            <label for="username">Username</label>
                            <input type="text" id="username" required>
                        </div>
                        <div class="form-group">
                            <label for="dob">Date of Birth</label>
                            <input type="date" id="dob" required>
                        </div>
                        <div class="form-group">
                            <label for="phonenumber">Phone number</label>
                            <input type="text" id="phonenumber" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email Address</label>
                            <input type="email" id="email" required>
                        </div>
                        <div class="form-actions">
                            <button type="button" class="btn btn-primary" onclick="completeStep(1)">
                                <i class="fas fa-arrow-right"></i> Continue
                            </button>
                        </div>
                    </form>
                </div>

                <div class="step-content" data-step="2">
                    <h3 class="step-title"><i class="fas fa-id-card"></i> Identity Verification</h3>
                    <p class="step-description">Verify your identity documents to ensure secure transactions</p>
                    <form class="kyc-form" id="identityForm">
                        <div class="document-section">
                            <div class="document-card">
                                <div class="document-header">
                                    <div class="document-icon">
                                        <img src="/images/aadhar.png" alt="Aadhaar Logo" style="width: 100%; height: 100%; object-fit: contain; background-color: white; border-radius: 12px;">
                                    </div>
                                    <div>
                                        <h4 class="document-title">Aadhaar Verification</h4>
                                        <p class="document-subtitle">Enter your Aadhaar number for verification</p>
                                    </div>
                                </div>
                                <div class="id-preview">
                                    <div class="id-logo">
                                        <i class="fas fa-address-card"></i>
                                    </div>
                                    <div class="id-details">
                                        <h4>Enter Aadhaar Details</h4>
                                        <div class="id-number-input">
                                            <label for="aadhaarNumber">Aadhaar Number</label>
                                            <input type="text" id="aadhaarNumber" placeholder="XXXX XXXX XXXX" required>
                                        </div>
                                        <button type="button" class="verify-btn" id="getOtpBtn">
                                            <i class="fas fa-paper-plane"></i> Get OTP
                                        </button>
                                        <div id="otpSection" style="display: none;">
                                            <div class="id-number-input">
                                                <label for="requestIdDisplay">Request ID</label>
                                                <input type="text" id="requestIdDisplay" readonly>
                                            </div>
                                            <div class="id-number-input">
                                                <label for="otp">Enter OTP</label>
                                                <input type="text" id="otp" placeholder="Enter OTP" required>
                                            </div>
                                            <button type="button" class="verify-btn" id="submitOtpBtn">
                                                <i class="fas fa-check-circle"></i> Submit OTP
                                            </button>
                                            <div id="resendOtpSection" style="margin-top: 1rem; display: flex; align-items: center; gap: 0.5rem;">
                                                <a href="#" id="resendOtpLink" style="color: var(--studio-blue); text-decoration: none; pointer-events: none; opacity: 0.5;">Resend OTP</a>
                                                <span id="timer" style="color: var(--primary-light); font-weight: 500; background: rgba(255, 255, 255, 0.1); padding: 0.3rem 0.7rem; border-radius: 4px;"></span>
                                            </div>
                                            <button type="button" class="verify-btn" id="verifyAadhaarBtn" style="display: none;">
                                                <i class="fas fa-check-circle"></i> Verify Aadhaar
                                            </button>
                                        </div>
                                        <div id="aadhaarStatus" class="verification-status" style="display: none;">
                                            <i class="fas fa-circle-notch fa-spin status-icon"></i>
                                            <span>Verifying...</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="document-card">
                                <div class="document-header">
                                    <div class="document-icon">
                                        <img class="pancard" src="/images/pancard.png" alt="Pancard Logo" style="width: 110%; height:110%; object-fit: contain; background-color: white; border-radius: 12px;">
                                    </div>
                                    <div>
                                        <h4 class="document-title">PAN Verification</h4>
                                        <p class="document-subtitle">Enter your PAN number for verification</p>
                                    </div>
                                </div>
                                <div class="id-preview">
                                    <div class="id-logo">
                                        <i class="fas fa-id-badge"></i>
                                    </div>
                                    <div class="id-details">
                                        <h4>Enter PAN Details</h4>
                                        <div class="id-number-input">
                                            <label for="panNumber">PAN Number</label>
                                            <input type="text" id="panNumber" placeholder="ABCDE1234F" required>
                                        </div>
                                        <button type="button" class="verify-btn" id="panVerifyBtn" onclick="verifyPAN()">
                                            <i class="fas fa-check-circle"></i> Verify PAN
                                        </button>
                                        <div id="panStatus" class="verification-status" style="display: none;">
                                            <i class="fas fa-circle-notch fa-spin status-icon"></i>
                                            <span>Verifying...</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-actions">
                            <button type="button" class="btn btn-outline" onclick="goToStep(1)">
                                <i class="fas fa-arrow-left"></i> Back
                            </button>
                            <button type="button" class="btn btn-primary" id="identityProceedBtn" onclick="completeStep(2)" disabled>
                                <i class="fas fa-check"></i> Verify Identity
                            </button>
                        </div>
                    </form>
                </div>

                <div class="step-content" data-step="3">
                    <h3 class="step-title"><i class="fas fa-home"></i> Address Verification</h3>
                    <p class="step-description">Verify your current residential address for compliance and documentation</p>
                    <form class="kyc-form" id="addressForm">
                        <div class="form-group full-width">
                            <label for="address1">Address Line 1</label>
                            <input type="text" id="address1" required>
                        </div>
                        <div class="form-group full-width">
                            <label for="address2">Address Line 2</label>
                            <input type="text" id="address2">
                        </div>
                        <div class="form-group">
                            <label for="city">City</label>
                            <input type="text" id="city" required>
                        </div>
                        <div class="form-group">
                            <label for="state">State</label>
                            <input type="text" id="state" required>
                        </div>
                        <div class="form-group">
                            <label for="zip">ZIP Code</label>
                            <input type="text" id="zip" required>
                        </div>
                        <div class="form-group">
                            <label for="country">Country</label>
                            <input type="text" id="country" required>
                        </div>
                        <div class="form-actions">
                            <button type="button" class="btn btn-outline" onclick="goToStep(2)">
                                <i class="fas fa-arrow-left"></i> Back
                            </button>
                            <button type="button" class="btn btn-primary" onclick="completeStep(3)">
                                <i class="fas fa-check"></i> Verify Address
                            </button>
                        </div>
                    </form>
                </div>

                <div class="step-content" data-step="4">
                    <h3 class="step-title"><i class="fas fa-wallet"></i> Financial Information</h3>
                    <p class="step-description">Provide your financial details for investment purposes and payment processing</p>
                    <form class="kyc-form" id="financialForm">
                        <div class="form-group">
                            <label for="bankName">Bank Name</label>
                            <input type="text" id="bankName" required>
                        </div>
                        <div class="form-group">
                            <label for="accountNumber">Account Number</label>
                            <input type="text" id="accountNumber" required>
                        </div>
                        <div class="form-group">
                            <label for="ifsc">IFSC Code</label>
                            <input type="text" id="ifsc" required>
                        </div>
                        <div class="form-group">
                            <label for="companyname">Company Name</label>
                            <input type="text" id="companyname" required>
                        </div>
                        <div class="form-group">
                            <label for="gstnumber">GST Number</label>
                            <input type="text" id="gstnumber" required>
                        </div>
                        <div class="form-group">
                            <label for="occupation">Occupation</label>
                            <input type="text" id="occupation" required>
                        </div>
                        <div class="form-group full-width">
                            <label for="income">Annual Income (₹)</label>
                            <input type="text" id="income" required>
                        </div>
                        <div class="form-actions">
                            <button type="button" class="btn btn-outline" onclick="goToStep(3)">
                                <i class="fas fa-arrow-left"></i> Back
                            </button>
                            <button type="button" class="btn btn-primary" onclick="completeStep(4)">
                                <i class="fas fa-check-circle"></i> Complete Verification
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="modal-overlay" id="successModal">
            <div class="modal-content">
                <div class="modal-icon">
                    <i class="fas fa-check-circle"></i>
                </div>
                <h2 class="modal-title">Verification Complete!</h2>
                <p class="modal-text">Congratulations! Your KYC verification has been successfully completed. You can now access all investment opportunities on Cinevestor.</p>
                <button class="modal-btn" onclick="redirectToDashboard()">
                    <i class="fas fa-tachometer-alt"></i> Go to Dashboard
                </button>
            </div>
        </div>

        <script>
            let completedSteps = 0;
            let aadhaarVerified = false;
            let panVerified = false;
            let aadhaarVerificationStatus = 'pending';
            let panStatus = "pending";
            let otpValidated = false;
            let timerInterval = null;

            function startTimer(duration, display) {
                let timer = duration;
                const interval = setInterval(function () {
                    let minutes = parseInt(timer / 60, 10);
                    let seconds = parseInt(timer % 60, 10);

                    minutes = minutes < 10 ? "0" + minutes : minutes;
                    seconds = seconds < 10 ? "0" + seconds : seconds;

                    display.textContent = minutes + ":" + seconds;

                    if (--timer < 0) {
                        clearInterval(interval);
                        display.textContent = "00:00";
                        document.getElementById('resendOtpLink').style.pointerEvents = 'auto';
                        document.getElementById('resendOtpLink').style.opacity = '1';
                    }
                }, 1000);
                let initialMinutes = parseInt(timer / 60, 10);
                let initialSeconds = parseInt(timer % 60, 10);
                initialMinutes = initialMinutes < 10 ? "0" + initialMinutes : initialMinutes;
                initialSeconds = initialSeconds < 10 ? "0" + initialSeconds : initialSeconds;
                display.textContent = initialMinutes + ":" + initialSeconds;
                return interval;
            }

            document.addEventListener('DOMContentLoaded', function() {
                // Create message div
                const messageDiv = document.createElement('div');
                messageDiv.id = 'message';
                messageDiv.style.padding = '1rem';
                messageDiv.style.margin = '1rem 0';
                messageDiv.style.borderRadius = '8px';
                messageDiv.style.textAlign = 'center';
                messageDiv.style.display = 'none';
                document.querySelector('.kyc-container').prepend(messageDiv);

                // Define requestIdDisplay
                const requestIdDisplay = document.getElementById('requestIdDisplay');

                // Reset UI state on page load (handles refresh)
                const otpSection = document.getElementById('otpSection');
                const getOtpBtn = document.getElementById('getOtpBtn');
                const submitOtpBtn = document.getElementById('submitOtpBtn');
                const verifyAadhaarBtn = document.getElementById('verifyAadhaarBtn');
                const otpInput = document.getElementById('otp');
                const resendOtpSection = document.getElementById('resendOtpSection');
                const resendOtpLink = document.getElementById('resendOtpLink');
                const timerElement = document.getElementById('timer');

                otpSection.style.display = 'none';
                getOtpBtn.style.display = 'inline-flex';
                otpInput.value = '';
                otpInput.readOnly = false;
                submitOtpBtn.innerHTML = '<i class="fas fa-check-circle"></i> Submit OTP';
                submitOtpBtn.style.opacity = '1';
                submitOtpBtn.style.cursor = 'pointer';
                submitOtpBtn.disabled = false;
                submitOtpBtn.style.backgroundColor = '';
                submitOtpBtn.style.color = '';
                submitOtpBtn.style.borderColor = '';
                verifyAadhaarBtn.style.display = 'none';
                resendOtpSection.style.display = 'flex';
                resendOtpLink.style.pointerEvents = 'none';
                resendOtpLink.style.opacity = '0.5';
                timerElement.textContent = '';
                requestIdDisplay.value = ''; // Clear requestIdDisplay on page load
                if (timerInterval) {
                    clearInterval(timerInterval);
                    timerInterval = null;
                }

                // Format Aadhaar input
                const aadhaarInput = document.getElementById('aadhaarNumber');
                aadhaarInput.addEventListener('input', function(e) {
                    let value = e.target.value.replace(/\D/g, '');
                    if (value.length > 12) value = value.slice(0, 12);
                    let formatted = '';
                    for (let i = 0; i < value.length; i++) {
                        if (i === 4 || i === 8) formatted += ' ';
                        formatted += value[i];
                    }
                    e.target.value = formatted;
                });

                // Fetch user data
                const username = "${username}";
                if (username) {
                    fetch(`/api/user/getCurrentUser?username=${username}`)
                        .then(response => {
                            if (!response.ok) throw new Error('Failed to fetch user');
                            return response.json();
                        })
                        .then(user => {
                            const usernameInput = document.getElementById('username');
                            if (usernameInput) {
                                usernameInput.value = user.username || '';
                                usernameInput.readOnly = true;
                            }
                            const emailInput = document.getElementById('email');
                            if (emailInput && user.email) {
                                emailInput.value = user.email || '';
                            }
                            const phonenumberInput = document.getElementById('phonenumber');
                            if (phonenumberInput && user.phonenumber) {
                                phonenumberInput.value = user.phonenumber || '';
                            }
                            const dobInput = document.getElementById('dob');
                            if (dobInput && user.dob) {
                                dobInput.value = user.dob || '';
                            }
                        })
                        .catch(error => {
                            messageDiv.textContent = 'Error fetching user: ' + error.message;
                            messageDiv.style.backgroundColor = '#dc3545';
                            messageDiv.style.display = 'block';
                        });
                } else {
                    messageDiv.textContent = 'No username provided. Please try again.';
                    messageDiv.style.backgroundColor = '#dc3545';
                    messageDiv.style.display = 'block';
                }

                async function submitKYCData() {
                    if (!panVerified || !aadhaarVerified) {
                        messageDiv.textContent = 'Please verify both PAN and Aadhaar before submitting KYC.';
                        messageDiv.style.backgroundColor = '#dc3545';
                        messageDiv.style.display = 'block';
                        return;
                    }

                    const formData = new URLSearchParams();
                    formData.append('username', document.getElementById('username').value || '');
                    formData.append('dob', document.getElementById('dob').value || '');
                    formData.append('phonenumber', document.getElementById('phonenumber').value || '');
                    formData.append('email', document.getElementById('email').value || '');
                    formData.append('aadhaarNumber', document.getElementById('aadhaarNumber').value.replace(/\D/g, '') || '');
                    formData.append('panNumber', document.getElementById('panNumber').value || '');
                    formData.append('address1', document.getElementById('address1').value || '');
                    formData.append('address2', document.getElementById('address2').value || '');
                    formData.append('city', document.getElementById('city').value || '');
                    formData.append('state', document.getElementById('state').value || '');
                    formData.append('zip', document.getElementById('zip').value || '');
                    formData.append('country', document.getElementById('country').value || '');
                    formData.append('bankName', document.getElementById('bankName').value || '');
                    formData.append('accountNumber', document.getElementById('accountNumber').value || '');
                    formData.append('occupation', document.getElementById('occupation').value || '');
                    formData.append('ifsc', document.getElementById('ifsc').value || '');
                    formData.append('income', document.getElementById('income').value || '');
                    formData.append('companyname', document.getElementById('companyname').value || '');
                    formData.append('gstnumber', document.getElementById('gstnumber').value || '');
                    formData.append('panStatus', panStatus || '');  
                    formData.append('aadhaarStatus', aadhaarVerificationStatus || '');
                    formData.append('kycStatus', 'true');
                    try {
                        const response = await fetch('/api/dashboard/registerkyc', {
                            method: 'POST',
                            body: formData,
                            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
                        });
                        const result = await response.text();
                        if (response.ok) {
                            messageDiv.textContent = 'KYC submitted successfully! Redirecting...';
                            messageDiv.style.backgroundColor = '#28a745';
                            messageDiv.style.display = 'block';
                            showSuccessModal();
                        } else {
                            messageDiv.textContent = 'Submission failed: ' + result;
                            messageDiv.style.backgroundColor = '#dc3545';
                            messageDiv.style.display = 'block';
                        }
                    } catch (error) {
                        messageDiv.textContent = 'Network error: ' + error.message;
                        messageDiv.style.backgroundColor = '#dc3545';
                        messageDiv.style.display = 'block';
                    }
                }

                window.goToStep = function(stepNumber) {
                    const parsedStepNumber = parseInt(stepNumber, 10);
                    if (isNaN(parsedStepNumber) || parsedStepNumber < 1 || parsedStepNumber > 4) return;
                    const stepContent = document.querySelector('.step-content[data-step="' + parsedStepNumber + '"]');
                    if (!stepContent) return;
                    document.querySelectorAll('.step-content').forEach(content => content.classList.remove('active'));
                    stepContent.classList.add('active');
                    document.querySelectorAll('.progress-step').forEach(step => {
                        step.classList.remove('active');
                        if (parseInt(step.dataset.step, 10) === parsedStepNumber) step.classList.add('active');
                    });
                    if (timerInterval) {
                        clearInterval(timerInterval);
                        timerInterval = null;
                    }
                };

                window.completeStep = function(stepNumber) {
                    const parsedStepNumber = parseInt(stepNumber, 10);
                    if (isNaN(parsedStepNumber) || parsedStepNumber < 1 || parsedStepNumber > 4) return;
                    const stepContent = document.querySelector('.step-content[data-step="' + parsedStepNumber + '"]');
                    if (!stepContent) return;
                    const form = stepContent.querySelector('form');
                    if (!form) return;
                    if (!form.checkValidity()) {
                        form.reportValidity();
                        return;
                    }
                    if (parsedStepNumber === 2 && (!aadhaarVerified || !panVerified)) {
                        alert('Please verify both Aadhaar and PAN before proceeding');
                        return;
                    }
                    const step = document.querySelector('.progress-step[data-step="' + parsedStepNumber + '"]');
                    if (!step) return;
                    step.classList.add('completed');
                    step.classList.remove('active');
                    completedSteps = Math.max(completedSteps, parsedStepNumber);
                    const progressFill = document.querySelector('.progress-fill');
                    progressFill.style.width = `${(completedSteps / 4) * 100}%`;
                    if (parsedStepNumber < 4) {
                        const nextStep = parsedStepNumber + 1;
                        const nextProgressStep = document.querySelector('.progress-step[data-step="' + nextStep + '"]');
                        if (nextProgressStep) nextProgressStep.classList.add('active');
                        goToStep(nextStep);
                        const nextContent = document.querySelector('.step-content[data-step="' + nextStep + '"]');
                        if (nextContent) nextContent.style.animation = 'fadeIn 0.5s ease-out';
                    } else {
                        submitKYCData();
                    }
                };

                document.querySelectorAll('.progress-step').forEach(step => {
                    step.addEventListener('click', function() {
                        const stepNumber = parseInt(this.dataset.step, 10);
                        if (stepNumber <= completedSteps + 1) {
                            goToStep(stepNumber);
                            const content = document.querySelector('.step-content[data-step="' + stepNumber + '"]');
                            if (content) content.style.animation = 'slideIn 0.5s ease-out';
                        }
                    });
                });

                document.querySelectorAll('.file-input').forEach(input => {
                    input.addEventListener('change', function() {
                        const label = this.nextElementSibling;
                        if (this.files.length > 0) {
                            label.innerHTML = '<i class="fas fa-check"></i> ' + this.files[0].name;
                        }
                    });
                });

                window.getOTP = async function() {
                    const aadhaarInput = document.getElementById('aadhaarNumber').value.trim();
                    const aadhaarNumber = aadhaarInput.replace(/\D/g, '');
                    const messageDiv = document.getElementById('message');
                    const aadhaarStatus = document.getElementById('aadhaarStatus');
                    const submitOtpBtn = document.getElementById('submitOtpBtn');
                    const verifyAadhaarBtn = document.getElementById('verifyAadhaarBtn');
                    const otpInput = document.getElementById('otp');
                    const requestIdDisplay = document.getElementById('requestIdDisplay');

                    if (!/^\d{12}$/.test(aadhaarNumber)) {
                        messageDiv.textContent = 'Please enter a valid 12-digit Aadhaar number';
                        messageDiv.style.backgroundColor = '#dc3545';
                        messageDiv.style.display = 'block';
                        return;
                    }

                    // Reset UI state
                    otpInput.value = '';
                    otpInput.readOnly = false;
                    submitOtpBtn.innerHTML = '<i class="fas fa-check-circle"></i> Submit OTP';
                    submitOtpBtn.style.opacity = '1';
                    submitOtpBtn.style.cursor = 'pointer';
                    submitOtpBtn.disabled = false;
                    submitOtpBtn.style.backgroundColor = '';
                    submitOtpBtn.style.color = '';
                    submitOtpBtn.style.borderColor = '';
                    verifyAadhaarBtn.style.display = 'none';
                    document.getElementById('resendOtpSection').style.display = 'flex';
                    document.getElementById('resendOtpLink').style.pointerEvents = 'none';
                    document.getElementById('resendOtpLink').style.opacity = '0.5';
                    requestIdDisplay.value = ''; // Clear requestIdDisplay on new request

                    aadhaarStatus.style.display = 'flex';
                    aadhaarStatus.className = 'verification-status status-pending';
                    aadhaarStatus.innerHTML = '<i class="fas fa-circle-notch fa-spin status-icon"></i><span>Sending OTP...</span>';

                    if (timerInterval) {
                        clearInterval(timerInterval);
                        timerInterval = null;
                    }

                    try {
                        const response = await fetch('/generate', {
                            method: 'POST',
                            headers: { 'Content-Type': 'application/json' },
                            body: JSON.stringify({ adhar: aadhaarNumber })
                        });

                        if (!response.ok) {
                            const text = await response.text();
                            throw new Error(`Server error (Status: ${response.status}): ${text || 'No response body'}`);
                        }

                        const contentType = response.headers.get('Content-Type');
                        let data;
                        if (contentType && contentType.includes('application/json')) {
                            data = await response.json();
                        } else {
                            const text = await response.text();
                            try {
                                data = JSON.parse(text);
                            } catch (jsonError) {
                                throw new Error(`Expected JSON but received: ${text || 'Empty response'}`);
                            }
                        }

                        // Log the full response
                        console.log('Aadhaar API response (getOTP):', data);

                        if (data.statusCode === 200 && data.msg === 'success' && data.data) {
                            sessionStorage.setItem('requestId', data.data);
                            requestIdDisplay.value = data.data; // Display requestId
                            document.getElementById('otpSection').style.display = 'block';
                            document.getElementById('getOtpBtn').style.display = 'none';
                            aadhaarStatus.style.display = 'none';

                            const timerElement = document.getElementById('timer');
                            if (!timerElement) {
                                console.error('Timer element not found in DOM');
                                messageDiv.textContent = 'Timer element missing. Please contact support.';
                                messageDiv.style.backgroundColor = '#dc3545';
                                messageDiv.style.display = 'block';
                                return;
                            }
                            timerInterval = startTimer(120, timerElement);
                            messageDiv.textContent = 'OTP sent to your registered mobile number';
                            messageDiv.style.backgroundColor = '#28a745';
                            messageDiv.style.display = 'block';
                        } else {
                            aadhaarStatus.className = 'verification-status status-pending';
                            aadhaarStatus.innerHTML = '<i class="fas fa-exclamation-circle status-icon"></i><span>OTP Sending Failed</span>';
                            messageDiv.textContent = data.statusCode === 422
                                ? 'Invalid Aadhaar number. Please enter a valid 12-digit Aadhaar number.'
                                : 'Failed to send OTP. Please try again or contact support.';
                            messageDiv.style.backgroundColor = '#dc3545';
                            messageDiv.style.display = 'block';
                        }
                    } catch (error) {
                        console.log('Error generating OTP:', error);
                        aadhaarStatus.className = 'verification-status status-pending';
                        aadhaarStatus.innerHTML = '<i class="fas fa-exclamation-circle status-icon"></i><span>OTP Sending Failed</span>';
                        messageDiv.textContent = `An error occurred while sending OTP: ${error.message}`;
                        messageDiv.style.backgroundColor = '#dc3545';
                        messageDiv.style.display = 'block';
                    }
                };

                window.submitOTP = async function() {
    const otp = document.getElementById('otp').value.trim();
    const requestId = sessionStorage.getItem('requestId');
    const messageDiv = document.getElementById('message');
    const aadhaarStatus = document.getElementById('aadhaarStatus');
    const submitOtpBtn = document.getElementById('submitOtpBtn');
    const verifyAadhaarBtn = document.getElementById('verifyAadhaarBtn');
    const requestIdDisplay = document.getElementById('requestIdDisplay');

    console.log('OTP:', otp, 'Request ID:', requestId, 'verifyAadhaarBtn:', verifyAadhaarBtn);

    if (!otp) {
        messageDiv.textContent = 'Please enter the OTP';
        messageDiv.style.backgroundColor = '#dc3545';
        messageDiv.style.display = 'block';
        return;
    }
    if (!requestId) {
        messageDiv.textContent = 'No request ID found. Please request OTP again.';
        messageDiv.style.backgroundColor = '#dc3545';
        messageDiv.style.display = 'block';
        return;
    }

    aadhaarStatus.style.display = 'flex';
    aadhaarStatus.className = 'verification-status status-pending';
    aadhaarStatus.innerHTML = '<i class="fas fa-circle-notch fa-spin status-icon"></i><span>Validating OTP...</span>';
    submitOtpBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Validating...';
    submitOtpBtn.style.opacity = '0.7';
    submitOtpBtn.style.cursor = 'not-allowed';
    submitOtpBtn.disabled = true;

    try {
        const response = await fetch('/verify', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ otp, request_id: requestId })
        });

        if (!response.ok) {
            const text = await response.text();
            throw new Error(`HTTP error! status: ${response.status}, body: ${text || 'No response body'}`);
        }

        const contentType = response.headers.get('Content-Type');
        let data;
        if (contentType && contentType.includes('application/json')) {
            data = await response.json();
        } else {
            const text = await response.text();
            try {
                data = JSON.parse(text);
            } catch (jsonError) {
                throw new Error(`Expected JSON but received: ${text || 'Empty response'}`);
            }
        }

        console.log('Aadhaar API response (submitOTP):', data);

        if (data.statusCode === 200 && data.status === 'success') {
            otpValidated = true;
            if (timerInterval) {
                clearInterval(timerInterval);
                timerInterval = null;
            }
            sessionStorage.removeItem('requestId');
            // Hide specific elements instead of the entire otpSection
            document.getElementById('requestIdDisplay').parentElement.style.display = 'none'; // Hide Request ID input
            document.getElementById('otp').parentElement.style.display = 'none'; // Hide OTP input
            submitOtpBtn.style.display = 'none'; // Hide Submit OTP button
            document.getElementById('resendOtpSection').style.display = 'none'; // Hide Resend OTP section
            verifyAadhaarBtn.style.display = 'inline-flex'; // Show Verify Aadhaar button
            verifyAadhaarBtn.style.visibility = 'visible'; // Ensure visibility
            aadhaarStatus.style.display = 'none';
            messageDiv.textContent = 'OTP validated successfully. Click "Verify Aadhaar" to complete verification.';
            messageDiv.style.backgroundColor = '#28a745';
            messageDiv.style.display = 'block';
            console.log('verifyAadhaarBtn after setting display:', verifyAadhaarBtn.style.display);
        } else if (data.statusCode === 400 && (data.message || data.data?.message || data.error)?.includes('Request already processed')) {
            sessionStorage.removeItem('requestId');
            messageDiv.textContent = 'This request has already been processed. Please request a new OTP.';
            messageDiv.style.backgroundColor = '#dc3545';
            messageDiv.style.display = 'block';
            submitOtpBtn.innerHTML = '<i class="fas fa-check-circle"></i> Submit OTP';
            submitOtpBtn.style.opacity = '1';
            submitOtpBtn.style.cursor = 'pointer';
            submitOtpBtn.disabled = false;
            aadhaarStatus.style.display = 'none';
            document.getElementById('otpSection').style.display = 'none'; // Reset to initial state
            document.getElementById('getOtpBtn').style.display = 'inline-flex';
            document.getElementById('otp').value = '';
        } else {
            submitOtpBtn.innerHTML = '<i class="fas fa-check-circle"></i> Submit OTP';
            submitOtpBtn.style.opacity = '1';
            submitOtpBtn.style.cursor = 'pointer';
            submitOtpBtn.disabled = false;
            aadhaarStatus.className = 'verification-status status-pending';
            aadhaarStatus.innerHTML = '<i class="fas fa-exclamation-circle status-icon"></i><span>OTP Validation Failed</span>';
            messageDiv.textContent = data.message || 'Invalid OTP. Please try again.';
            messageDiv.style.backgroundColor = '#dc3545';
            messageDiv.style.display = 'block';
        }
    } catch (error) {
        console.log('Error validating OTP:', error);
        submitOtpBtn.innerHTML = '<i class="fas fa-check-circle"></i> Submit OTP';
        submitOtpBtn.style.opacity = '1';
        submitOtpBtn.style.cursor = 'pointer';
        submitOtpBtn.disabled = false;
        aadhaarStatus.className = 'verification-status status-pending';
        aadhaarStatus.innerHTML = '<i class="fas fa-exclamation-circle status-icon"></i><span>OTP Validation Failed</span>';
        messageDiv.textContent = `An error occurred while validating OTP: ${error.message}`;
        messageDiv.style.backgroundColor = '#dc3545';
        messageDiv.style.display = 'block';
    }

    // Clear requestIdDisplay after every Submit OTP click
    requestIdDisplay.value = '';
};

window.verifyAadhaar = function() {
    const messageDiv = document.getElementById('message');
    const aadhaarStatus = document.getElementById('aadhaarStatus');
    const verifyAadhaarBtn = document.getElementById('verifyAadhaarBtn');
    

    if (!otpValidated) {
        messageDiv.textContent = 'Please validate OTP first';
        messageDiv.style.backgroundColor = '#dc3545';
        messageDiv.style.display = 'block';
        return;
    }

    aadhaarStatus.style.display = 'flex';
    aadhaarStatus.className = 'verification-status status-pending';
    aadhaarStatus.innerHTML = '<i class="fas fa-circle-notch fa-spin status-icon"></i><span>Verifying Aadhaar...</span>';
    verifyAadhaarBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Verifying...';
    verifyAadhaarBtn.style.opacity = '0.7';
    verifyAadhaarBtn.style.cursor = 'not-allowed';
    verifyAadhaarBtn.disabled = true;

    setTimeout(() => {
        aadhaarVerified = true;
        aadhaarVerificationStatus = 'verified';
        verifyAadhaarBtn.innerHTML = '<i class="fas fa-check-circle"></i> Verified';
        verifyAadhaarBtn.style.backgroundColor = 'rgba(46, 204, 113, 0.2)';
        verifyAadhaarBtn.style.color = 'var(--success-green)';
        verifyAadhaarBtn.style.borderColor = 'var(--success-green)';
        verifyAadhaarBtn.style.cursor = 'default';
        aadhaarStatus.className = 'verification-status status-verified';
        aadhaarStatus.innerHTML = '<i class="fas fa-check-circle status-icon"></i><span>Aadhaar Verified</span>';
        messageDiv.textContent = 'Aadhaar verified successfully!';
        messageDiv.style.backgroundColor = '#28a745';
        messageDiv.style.display = 'block';
        checkIdentityVerification();
    }, 500);
};

                window.resendOTP = function() {
                    const timerElement = document.getElementById('timer');
                    if (timerElement.textContent === '00:00') {
                        otpValidated = false;
                        document.getElementById('verifyAadhaarBtn').style.display = 'none';
                        document.getElementById('submitOtpBtn').innerHTML = '<i class="fas fa-check-circle"></i> Submit OTP';
                        document.getElementById('submitOtpBtn').style.opacity = '1';
                        document.getElementById('submitOtpBtn').style.cursor = 'pointer';
                        document.getElementById('submitOtpBtn').disabled = false;
                        document.getElementById('otp').readOnly = false;
                        document.getElementById('otp').value = '';
                        getOTP();
                    }
                };

                window.verifyPAN = function() {
                const panNumber = document.getElementById('panNumber').value;
                const panStatusElement = document.getElementById('panStatus');
                const panVerifyBtn = document.getElementById('panVerifyBtn');
                const messageDiv = document.getElementById('message');

    const panPattern = /^[A-Z]{5}[0-9]{4}[A-Z]{1}$/;
    if (!panNumber || !panPattern.test(panNumber)) {
        messageDiv.textContent = 'Please enter a valid PAN number (format: ABCDE1234F)';
        messageDiv.style.backgroundColor = '#dc3545';
        messageDiv.style.display = 'block';
        return;
    }

    panVerifyBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Verifying...';
    panVerifyBtn.style.opacity = '0.7';
    panVerifyBtn.style.cursor = 'not-allowed';
    panStatusElement.style.display = 'flex';
    panStatusElement.className = 'verification-status status-pending';
    panStatusElement.innerHTML = '<i class="fas fa-circle-notch fa-spin status-icon"></i><span>Verifying PAN...</span>';

    fetch('/securePanVerify', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ pan: panNumber })
    })
    .then(response => {
        console.log('Fetch response status:', response.status);
        if (!response.ok) throw new Error(`PAN verification failed with status: ${response.status}`);
        return response.json();
    })
    .then(data => {
        console.log('Parsed response:', data);
 

        if (data.statusCode === 200 && data.msg === 'success') {
            panVerified = true;
            panStatus = 'verified';
            panVerifyBtn.innerHTML = '<i class="fas fa-check-circle"></i> Verified';
            panVerifyBtn.style.backgroundColor = 'rgba(46, 204, 113, 0.2)';
            panVerifyBtn.style.color = 'var(--success-green)';
            panVerifyBtn.style.borderColor = 'var(--success-green)';
            panVerifyBtn.style.cursor = 'default';
            panVerifyBtn.disabled = true;

            panStatusElement.className = 'verification-status status-verified';
            panStatusElement.innerHTML = '<i class="fas fa-check-circle status-icon"></i><span>PAN Verified</span>';

            messageDiv.textContent = 'PAN verified successfully!';
            messageDiv.style.backgroundColor = '#28a745';
            messageDiv.style.display = 'block';
        } else {
            console.log('Entered failure block with data:', data);
            panVerified = false;
            panStatus = 'pending';
            panVerifyBtn.innerHTML = '<i class="fas fa-times-circle"></i> Verify Failed';
            panVerifyBtn.style.backgroundColor = 'rgba(231, 76, 60, 0.2)';
            panVerifyBtn.style.color = 'var(--investor-pink)';
            panVerifyBtn.style.borderColor = 'var(--investor-pink)';
            panVerifyBtn.style.cursor = 'pointer';
            panVerifyBtn.disabled = false;

            panStatusElement.className = 'verification-status status-pending';
            panStatusElement.innerHTML = '<i class="fas fa-exclamation-circle status-icon"></i><span>Verification Failed</span>';

            messageDiv.textContent = `PAN verification failed: ${data.message || 'Unknown error'}`;
            messageDiv.style.backgroundColor = '#dc3545';
            messageDiv.style.display = 'block';
        }

        checkIdentityVerification();
    })
    .catch(error => {
        console.error('Error during PAN verification:', error);
        panVerified = false;
        panStatus = 'pending';
        panVerifyBtn.innerHTML = '<i class="fas fa-times-circle"></i> Verify Failed';
        panVerifyBtn.style.backgroundColor = 'rgba(231, 76, 60, 0.2)';
        panVerifyBtn.style.color = 'var(--investor-pink)';
        panVerifyBtn.style.borderColor = 'var(--investor-pink)';
        panVerifyBtn.style.cursor = 'pointer';
        panVerifyBtn.disabled = false;

        panStatusElement.className = 'verification-status status-pending';
        panStatusElement.innerHTML = '<i class="fas fa-exclamation-circle status-icon"></i><span>Verification Failed</span>';

        messageDiv.textContent = `Error during PAN verification: ${error.message}`;
        messageDiv.style.backgroundColor = '#dc3545';
        messageDiv.style.display = 'block';

        checkIdentityVerification();
    });
};
                function checkIdentityVerification() {
                    const identityProceedBtn = document.getElementById('identityProceedBtn');
                    if (aadhaarVerified && panVerified) {
                        identityProceedBtn.disabled = false;
                    } else {
                        identityProceedBtn.disabled = true;
                    }
                }

                function showSuccessModal() {
                    const modal = document.getElementById('successModal');
                    if (modal) {
                        modal.classList.add('active');
                        createConfetti();
                    }
                }

                window.redirectToDashboard = function() {
                    window.location.href = '/dashboard';
                };

                document.addEventListener('click', function(e) {
                    if (e.target.classList.contains('btn') || e.target.closest('.btn')) {
                        const button = e.target.classList.contains('btn') ? e.target : e.target.closest('.btn');
                        const ripple = document.createElement('span');
                        ripple.classList.add('ripple');
                        const rect = button.getBoundingClientRect();
                        const x = e.clientX - rect.left;
                        const y = e.clientY - rect.top;
                        ripple.style.left = x + 'px';
                        ripple.style.top = y + 'px';
                        button.appendChild(ripple);
                        setTimeout(() => ripple.remove(), 600);
                    }
                });

                function createConfetti() {
                    const colors = ['#ff8906', '#e53170', '#3da9fc', '#2ecc71', '#f1c40f'];
                    const container = document.querySelector('.modal-content');
                    for (let i = 0; i < 50; i++) {
                        const confetti = document.createElement('div');
                        confetti.style.position = 'absolute';
                        const confettiSize = Math.random() * 8 + 4 + 'px';
                        confetti.style.width = confettiSize;
                        confetti.style.height = confettiSize;
                        confetti.style.backgroundColor = colors[Math.floor(Math.random() * colors.length)];
                        confetti.style.borderRadius = Math.random() > 0.5 ? '50%' : '0%';
                        confetti.style.left = Math.random() * 100 + '%';
                        confetti.style.top = '-10px';
                        confetti.style.opacity = Math.random() * 0.5 + 0.5;
                        const rotation = Math.random() * 360;
                        confetti.style.transform = `rotate(${rotation}deg)`;
                        confetti.style.animation = `fall${i} ${Math.random() * 3 + 2}s linear forwards`;
                        const keyframes = `
                            @keyframes fall${i} {
                                to {
                                    transform: translateY(calc(100vh + 10px)) rotate(${rotation + Math.random() * 360}deg);
                                    opacity: 0;
                                }
                            }
                        `;
                        const style = document.createElement('style');
                        style.innerHTML = keyframes;
                        document.head.appendChild(style);
                        container.appendChild(confetti);
                        setTimeout(() => {
                            confetti.remove();
                            style.remove();
                        }, 5000);
                    }
                }

                // Add event listeners for buttons
                document.getElementById('getOtpBtn').addEventListener('click', getOTP);
                document.getElementById('submitOtpBtn').addEventListener('click', submitOTP);
                document.getElementById('resendOtpLink').addEventListener('click', resendOTP);
                document.getElementById('verifyAadhaarBtn').addEventListener('click', verifyAadhaar);
            });
        </script>
    </div>
</body>
</html>