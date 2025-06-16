<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cinevestor | Sign Up</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #0f0e17;
            --secondary: #1f1b3a;
            --filmmaker: #ff8906;
            --investor: #e53170;
            --light: #fffffe;
            --text: #a7a9be;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');
        
        body {
            background-color: var(--primary);
            color: var(--light);
            min-height: 100vh;
            display: grid;
            grid-template-columns: 1fr 1fr;
            overflow: hidden;
        }
        
        .film-section {
            position: relative;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        
        .film-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, rgba(15,14,23,0.8) 0%, rgba(31,27,58,0.6) 100%);
            z-index: 1;
        }
        
        .film-bg {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            z-index: 0;
            animation: zoomEffect 20s infinite alternate;
        }
        
        @keyframes zoomEffect {
            0% {
                transform: scale(1);
            }
            100% {
                transform: scale(1.1);
            }
        }
        
        .film-content {
            position: relative;
            z-index: 2;
            padding: 3rem;
            max-width: 600px;
        }
        
        .logo {
            font-size: 3rem;
            font-weight: 700;
            margin-bottom: 2rem;
            color: var(--light);
            display: inline-block;
        }
        
        .logo span {
            background: linear-gradient(45deg, var(--filmmaker), var(--investor));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        
        .film-title {
            font-size: 2.8rem;
            margin-bottom: 1.5rem;
            line-height: 1.2;
            background: linear-gradient(45deg, var(--light), var(--text));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        
        .film-subtitle {
            font-size: 1.2rem;
            margin-bottom: 2rem;
            line-height: 1.6;
            color: var(--text);
        }
        
        .features {
            margin-top: 3rem;
        }
        
        .feature {
            display: flex;
            align-items: center;
            margin-bottom: 1.5rem;
        }
        
        .feature-icon {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background: rgba(255,137,6,0.2);
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 1rem;
            color: var(--filmmaker);
            font-size: 1.2rem;
        }
        
        .feature-text h3 {
            font-size: 1.1rem;
            margin-bottom: 0.3rem;
            color: var(--light);
        }
        
        .feature-text p {
            font-size: 0.9rem;
            color: var(--text);
        }
        
        .auth-container {
            padding: 2rem;
            display: flex;
            flex-direction: column;
            justify-content: center;
            background-color: var(--secondary);
            position: relative;
            overflow-y: auto;
            height: 100vh;
        }
        
        .auth-container::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -50%;
            width: 100%;
            height: 100%;
            background: radial-gradient(circle, rgba(229,49,112,0.1) 0%, rgba(0,0,0,0) 70%);
            z-index: 0;
        }
        
        .auth-content {
            position: relative;
            z-index: 1;
            max-width: 450px;
            margin: 0 auto;
            width: 100%;
        }
        
        .auth-header {
            text-align: center;
            margin-bottom: 2rem;
        }
        
        .auth-title {
            font-size: 2rem;
            margin-bottom: 0.5rem;
            color: var(--light);
            position: relative;
            display: inline-block;
        }
        
        .auth-title::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 60px;
            height: 4px;
            background: linear-gradient(45deg, var(--filmmaker), var(--investor));
            border-radius: 2px;
        }
        
        .auth-subtitle {
            color: var(--text);
            font-size: 0.95rem;
        }
        
        .user-type-toggle {
            display: flex;
            margin-bottom: 2rem;
            border-radius: 8px;
            overflow: hidden;
            background: rgba(255,255,255,0.1);
            border: 1px solid rgba(255,255,255,0.1);
        }
        
        .user-option {
            flex: 1;
            padding: 1rem;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            z-index: 1;
        }
        
        .user-option::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            opacity: 0;
            transition: all 0.3s ease;
        }
        
        .user-option.filmmaker::before {
            background: var(--filmmaker);
        }
        
        .user-option.investor::before {
            background: var(--investor);
        }
        
        .user-option.active::before {
            opacity: 1;
        }
        
        .user-option i {
            font-size: 1.3rem;
            margin-bottom: 0.5rem;
            display: block;
            transition: all 0.3s ease;
        }
        
        .user-option.active i {
            color: white;
        }
        
        .user-option div {
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        .user-option.active div {
            color: white;
            font-weight: 600;
        }
        
        .auth-form {
            display: flex;
            flex-direction: column;
        }
        
        .name-group {
            display: flex;
            gap: 15px;
            margin-bottom: 1.5rem;
        }
        
        .name-group .input-group {
            flex: 1;
        }
        
        .input-group {
            margin-bottom: 1.5rem;
            position: relative;
        }
        
        .input-group label {
            display: block;
            margin-bottom: 0.8rem;
            color: var(--text);
            font-size: 0.95rem;
            font-weight: 500;
        }
        
        .input-group input {
            width: 100%;
            padding: 1rem 1.5rem;
            border: 2px solid rgba(255,255,255,0.1);
            border-radius: 8px;
            background: rgba(255,255,255,0.05);
            color: var(--light);
            font-size: 1rem;
            transition: all 0.3s ease;
        }
        
        .input-group input:focus {
            outline: none;
            border-color: var(--filmmaker);
            background: rgba(255,255,255,0.1);
            box-shadow: 0 0 0 4px rgba(255,137,6,0.1);
        }
        
        .input-group i {
            position: absolute;
            right: 15px;
            top: 43px;
            color: var(--text);
            transition: all 0.3sSilver ease;
        }
        
        .input-group input:focus + i {
            color: var(--filmmaker);
        }
        
        .terms {
            display: flex;
            align-items: flex-start;
            margin-bottom: 1.5rem;
            font-size: 0.9rem;
            color: var(--text);
        }
        
        .terms input {
            margin-right: 0.5rem;
            margin-top: 3px;
            accent-color: var(--filmmaker);
            min-width: 16px;
            cursor: pointer;
        }
        
        .terms a {
            color: var(--filmmaker);
            text-decoration: none;
        }
        
        .terms a:hover {
            text-decoration: underline;
        }
        
        .auth-button {
            background: linear-gradient(45deg, var(--filmmaker), var(--investor));
            color: white;
            border: none;
            padding: 1rem;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.4s ease;
            margin-bottom: 1.5rem;
            position: relative;
            overflow: hidden;
            z-index: 1;
        }
        
        .auth-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, var(--investor), var(--filmmaker));
            z-index: -1;
            opacity: 0;
            transition: opacity 0.4s ease;
        }
        
        .auth-button:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(229, 49, 112, 0.3);
        }
        
        .auth-button:hover::before {
            opacity: 1;
        }
        
        .auth-button:active {
            transform: translateY(-1px);
        }
        
        .divider {
            display: flex;
            align-items: center;
            margin: 1.5rem 0;
        }
        
        .divider::before, .divider::after {
            content: "";
            flex: 1;
            border-bottom: 1px solid rgba(255,255,255,0.1);
        }
        
        .divider-text {
            padding: 0 1rem;
            font-size: 0.8rem;
            color: var(--text);
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        
        .social-login {
            display: flex;
            justify-content: center;
            gap: 1rem;
            margin-bottom: 1.5rem;
        }
        
        .social-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: rgba(255,255,255,0.05);
            color: var(--text);
            cursor: pointer;
            transition: all 0.4s ease;
            border: 1px solid rgba(255,255,255,0.1);
        }
        
        .social-icon:hover {
            background-color: var(--filmmaker);
            color: var(--light);
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(255, 137, 6, 0.3);
            border-color: transparent;
        }
        
        .auth-footer {
            text-align: center;
            font-size: 0.95rem;
            color: var(--text);
        }
        
        .auth-footer a {
            color: var(--filmmaker);
            text-decoration: none;
            font-weight: 600;
            margin-left: 0.3rem;
            transition: all 0.3s ease;
            position: relative;
        }
        
        .auth-footer a::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 0;
            height: 2px;
            background: var(--filmmaker);
            transition: width 0.3s ease;
        }
        
        .auth-footer a:hover::after {
            width: 100%;
        }
        
        @media (max-width: 992px) {
            body {
                grid-template-columns: 1fr;
            }
            
            .film-section {
                display: none;
            }
            
            .auth-container {
                padding: 2rem;
                min-height: 100vh;
            }
        }
        
        @media (max-width: 576px) {
            .auth-container {
                padding: 1.5rem;
            }
            
            .auth-title {
                font-size: 1.8rem;
            }
            
            .name-group {
                flex-direction: column;
                gap: 0;
            }
        }
    </style>
</head>
<body>
    <section class="film-section">
        <img src="https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80" alt="Film set background" class="film-bg">
        <div class="film-content">
            <div class="logo">CINE<span>VESTOR</span></div>
            <h1 class="film-title">Where Creativity Meets contributions</h1>
            <p class="film-subtitle">
                The premier platform connecting visionary filmmakers with strategic supporters. 
                Join our community to bring cinematic projects to life.
            </p>
            <div class="features">
                <div class="feature">
                    <div class="feature-icon"><i class="fas fa-film"></i></div>
                    <div class="feature-text">
                        <h3>For Filmmakers</h3>
                        <p>Find investors for your projects and showcase your work</p>
                    </div>
                </div>
                <div class="feature">
                    <div class="feature-icon"><i class="fas fa-chart-line"></i></div>
                    <div class="feature-text">
                        <h3>For supporters</h3>
                        <p>Discover promising projects and track your contributions</p>
                    </div>
                </div>
                <div class="feature">
                    <div class="feature-icon"><i class="fas fa-network-wired"></i></div>
                    <div class="feature-text">
                        <h3>Global Network</h3>
                        <p>Connect with professionals worldwide in the film industry</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <div class="auth-container">
        <div class="auth-content">
            <div class="auth-header">
                <h2 class="auth-title">Join Our Community</h2>
                <p class="auth-subtitle">Create your Cinevestor account</p>
            </div>
            
            <div class="user-type-toggle">
                <div class="user-option filmmaker active" onclick="toggleUserType('filmmaker')">
                    <i class="fas fa-film"></i>
                    <div>Filmmaker</div>
                </div>
                <div class="user-option investor" onclick="toggleUserType('investor')">
                    <i class="fas fa-hand-holding-usd"></i>
                    <div>contributor</div>
                </div>
            </div>
            
            <form class="auth-form" id="signup-form" method="post" autocomplete="off">
                <div class="name-group">
                    <div class="input-group">
                        <label for="firstname">First Name</label>
                        <input type="text" id="FirstName" name="firstname" placeholder="Enter your first name" required>
                        <i class="fas fa-user"></i>
                    </div>
                    <div class="input-group">
                        <label for="lastname">Last Name</label>
                        <input type="text" id="LastName" name="lastname" placeholder="Enter your last name" required>
                        <i class="fas fa-user"></i>
                    </div>
                </div>
                
                <div class="input-group">
                    <label for="email">Email Address</label>
                    <input type="email" id="email" name="email" placeholder="Enter your email" required>
                    <i class="fas fa-envelope"></i>
                </div>

                <div class="input-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" placeholder="Enter your Username" required>
                    <i class="fas fa-shield-alt"></i>
                </div>
                
                <div class="input-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Create a password" required>
                    <i class="fas fa-lock"></i>
                </div>
                
                <!-- Optionally remove this if you don’t need it -->
                <div class="input-group">
                    <label for="confirm-password">Confirm Password</label>
                    <input type="password" id="confirm-password" placeholder="Confirm your password" required>
                    <i class="fas fa-lock"></i>
                </div>
                
                <div class="terms">
                    <input type="checkbox" id="terms" required>
                    <label for="terms">I agree to the <a href="#">Terms of Service</a> and <a href="#">Privacy Policy</a></label>
                </div>
                
                <button type="submit" class="auth-button">Create Account</button>
                
                <div id="message" style="display: none; padding: 1rem; color: white; text-align: center; border-radius: 8px; margin-top: 1rem;"></div>
                
                <div class="divider">
                    <span class="divider-text">Or continue with</span>
                </div>
                
                <div class="social-login">
                    <div class="social-icon"><i class="fab fa-google"></i></div>
                    <div class="social-icon"><i class="fab fa-linkedin-in"></i></div>
                    <div class="social-icon"><i class="fab fa-apple"></i></div>
                </div>
                
                <div class="auth-footer">
                    Already have an account? <a href="login">Log in</a>
                </div>
            </form>
        </div>
    </div>

    <script>
 function toggleUserType(type) {
        // 1. JSP-safe type validation
        const validType = String(type).replace(/[^a-z]/gi, '');  
        if (!['filmmaker', 'investor'].includes(validType)) return;

        // 2. JSP-safe selector construction
        const selector = '.user-option.' + CSS.escape(validType);
        const selectedOption = document.querySelector(selector);
        
        // 3. Safe class manipulation
        if (selectedOption) {
            document.querySelectorAll('.user-option').forEach(option => {
                option.classList.remove('active');
            });
            selectedOption.classList.add('active');
        }

        // 4. Gradient update with JSP-safe values
        const authButton = document.querySelector('.auth-button');
        if (authButton) {
            authButton.style.background = validType === 'filmmaker' 
                ? 'linear-gradient(45deg, #ff8906, #e53170)' // Use HEX values directly
                : 'linear-gradient(45deg, #e53170, #ff8906)';
        }
    }  
    
    
    document.getElementById('signup-form').addEventListener('submit', async function(e) {
        e.preventDefault();

        // Get form field values
        const firstname = document.getElementById('FirstName').value;
        const lastname = document.getElementById('LastName').value;
        const email = document.getElementById('email').value;
        const username = document.getElementById('username').value;
        const password = document.getElementById('password').value;

        // Construct form data
        const formData = new URLSearchParams();
        formData.append('FirstName', firstname);
        formData.append('LastName', lastname);
        formData.append('email', email);
        formData.append('username', username);
        formData.append('password', password);

        try {
            const response = await fetch('/api/user/signup', {
                method: 'POST',
                body: formData,
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
            });
            const result = await response.text();

            const messageDiv = document.getElementById('message');
            if (response.ok) {
                messageDiv.textContent = 'Registration successful! Redirecting...';
                messageDiv.style.backgroundColor = '#28a745';
                messageDiv.style.display = 'block';
                setTimeout(() => { window.location.href = '/login'; }, 2000);
            } else {
                messageDiv.textContent = result || 'Registration failed';
                messageDiv.style.backgroundColor = '#dc3545';
                messageDiv.style.display = 'block';
            }
        } catch (error) {
            const messageDiv = document.getElementById('message');
            messageDiv.textContent = 'Network error: ' + error.message;
            messageDiv.style.backgroundColor = '#dc3545';
            messageDiv.style.display = 'block';
        }
    });
 
    </script>
</body>
</html>