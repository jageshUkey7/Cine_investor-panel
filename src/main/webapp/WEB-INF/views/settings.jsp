<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cinevestor | Settings</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
    crossorigin="anonymous"></script>
    <style>
      :root {
            --primary-dark: #0f0e17;
            --primary-light: #fffffe;
            --filmmaker-orange: #ff8906;
            --investor-pink: #e53170;
            --studio-blue: #3da9fc;
            --success-green: #2ecc71;
            --gradient: linear-gradient(135deg, var(--filmmaker-orange), var(--investor-pink));
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
            min-height: 100vh;
            background-image: 
                radial-gradient(circle at 20% 30%, rgba(255, 137, 6, 0.1) 0%, transparent 30%),
                radial-gradient(circle at 80% 70%, rgba(229, 49, 112, 0.1) 0%, transparent 30%);
        }

        /* Layout Structure */
        .app-container {
            display: flex;
            min-height: 100vh;
        }

        .sidebar-space {
            width: var(--sidebar-width);
            flex-shrink: 0;
            position: relative;
        }

        .sidebar-space::after {
            content: '';
            position: absolute;
            top: 0;
            right: 0;
            width: 2px;
            height: 100%;
            background: var(--gradient);
            background-size: 400% 400%;
        }

        .main-content {
            flex: 1;
            padding: 2rem;
            max-width: calc(100% - var(--sidebar-width));
        }

        /* Settings Page Styles */
        .page-header {
            margin-bottom: 2rem;
        }

        .page-title {
            font-size: 2.2rem;
            background: var(--gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            display: flex;
            align-items: center;
            position: relative;
        }

        .page-title i {
            margin-right: 1rem;
        }

        .page-title::after {
            content: '';
            position: absolute;
            bottom: -8px;
            left: 0;
            width: 100px;
            height: 3px;
            background: var(--gradient);
            border-radius: 3px;
        }

        /* Settings Tabs */
        .settings-tabs {
            display: flex;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            margin-bottom: 2rem;
        }

        .tab {
            padding: 1rem 1.5rem;
            cursor: pointer;
            position: relative;
            font-weight: 500;
            opacity: 0.8;
            transition: all 0.3s ease;
        }

        .tab:hover {
            opacity: 1;
        }

        .tab.active {
            opacity: 1;
            color: var(--studio-blue);
        }

        .tab.active::after {
            content: '';
            position: absolute;
            bottom: -1px;
            left: 0;
            width: 100%;
            height: 2px;
            background: var(--studio-blue);
        }

        /* Settings Sections */
        .settings-section {
            display: none;
            max-width: 800px;
        }

        .settings-section.active {
            display: block;
        }

        .section-title {
            font-size: 1.5rem;
            margin-bottom: 1.5rem;
            color: var(--filmmaker-orange);
        }

        /* Form Elements */
        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
        }

        .form-control {
            width: 100%;
            padding: 0.8rem 1rem;
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 8px;
            color: var(--primary-light);
            font-size: 1rem;
        }

        .form-control:focus {
            outline: none;
            border-color: var(--studio-blue);
        }

        .form-text {
            font-size: 0.85rem;
            opacity: 0.7;
            margin-top: 0.5rem;
        }

        /* Toggle Switch */
        .toggle-switch {
            position: relative;
            display: inline-block;
            width: 50px;
            height: 24px;
        }

        .toggle-switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }

        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(255, 255, 255, 0.1);
            transition: .4s;
            border-radius: 24px;
        }

        .slider:before {
            position: absolute;
            content: "";
            height: 16px;
            width: 16px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            transition: .4s;
            border-radius: 50%;
        }

        input:checked + .slider {
            background-color: var(--studio-blue);
        }

        input:checked + .slider:before {
            transform: translateX(26px);
        }

        .toggle-label {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        /* Button Styles */
        .btn {
            padding: 0.8rem 1.5rem;
            border-radius: 8px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            border: none;
        }

        .btn-primary {
            background: var(--gradient);
            color: white;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(229, 49, 112, 0.3);
        }

        .btn-outline {
            background: transparent;
            color: var(--studio-blue);
            border: 1px solid var(--studio-blue);
        }

        .btn-outline:hover {
            background: rgba(61, 169, 252, 0.1);
        }

        /* Profile Picture */
        .profile-pic {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid var(--studio-blue);
            margin-bottom: 1rem;
        }

        .profile-upload {
            display: flex;
            align-items: center;
            gap: 1rem;
            margin-bottom: 1.5rem;
        }


        /* Responsive Design */
        @media (max-width: 768px) {
            .sidebar-space {
                width: 80px;
            }
            
            .main-content {
                max-width: calc(100% - 80px);
                padding: 1.5rem;
            }
            
            .settings-tabs {
                overflow-x: auto;
                white-space: nowrap;
                padding-bottom: 0.5rem;
            }
        }

        @media (max-width: 576px) {
            .profile-upload {
                flex-direction: column;
                align-items: flex-start;
            }
        }
    </style>
</head>
<body>

    <%@ include file="header.jsp"%>
   
        <div class="sidebar-space"></div>

        <!-- Main Content -->
        <main class="main-content">
            <div class="page-header">
                <h1 class="page-title">
                    <i class="fas fa-cog"></i>
                    Settings
                </h1>
            </div>

            <div class="settings-tabs">
                <div class="tab active" data-tab="profile">Profile</div>
                <div class="tab" data-tab="account">Account</div>
                <div class="tab" data-tab="notifications">Notifications</div>
                <div class="tab" data-tab="security">Security</div>
                <div class="tab" data-tab="payment">Payment Methods</div>
            </div>

            <!-- Profile Settings -->
            <div class="settings-section active" id="profile-section">
                <h3 class="section-title">Profile Information</h3>
                
                <div class="profile-upload">
                    <img src="https://via.placeholder.com/100" alt="Profile" class="profile-pic">
                    <div>
                        <button class="btn btn-outline">
                            <i class="fas fa-camera"></i> Change Photo
                        </button>
                        <p class="form-text">Recommended size: 100x100 pixels</p>
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="form-label">Full Name</label>
                    <input type="text" class="form-control" value="John Investor">
                </div>
                
                <div class="form-group">
                    <label class="form-label">Email</label>
                    <input type="email" class="form-control" value="john.investor@example.com">
                </div>
                
                <div class="form-group">
                    <label class="form-label">Phone Number</label>
                    <input type="tel" class="form-control" value="+1 (555) 123-4567">
                </div>
                
                <div class="form-group">
                    <label class="form-label">Bio</label>
                    <textarea class="form-control" rows="4">Film enthusiast and supporter with focus on independent cinema and documentaries.</textarea>
                </div>
                
                <button class="btn btn-primary">Save Changes</button>
            </div>

            <!-- Account Settings -->
            <div class="settings-section" id="account-section">
                <h3 class="section-title">Account Preferences</h3>
                
                <div class="form-group">
                    <label class="form-label">Language</label>
                    <select class="form-control">
                        <option>English</option>
                        <option>Spanish</option>
                        <option>French</option>
                        <option>German</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label class="form-label">Timezone</label>
                    <select class="form-control">
                        <option>(GMT-08:00) Pacific Time</option>
                        <option>(GMT-05:00) Eastern Time</option>
                        <option>(GMT+00:00) London</option>
                        <option>(GMT+01:00) Paris</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label class="form-label">Currency</label>
                    <select class="form-control">
                        <option>US Dollar (USD)</option>
                        <option>Euro (EUR)</option>
                        <option>British Pound (GBP)</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label class="toggle-label">
                        <span>Dark Mode</span>
                        <label class="toggle-switch">
                            <input type="checkbox" checked>
                            <span class="slider"></span>
                        </label>
                    </label>
                </div>
                
                <button class="btn btn-primary">Update Preferences</button>
            </div>

            <!-- Notification Settings -->
            <div class="settings-section" id="notifications-section">
                <h3 class="section-title">Notification Preferences</h3>
                
                <div class="form-group">
                    <label class="toggle-label">
                        <span>Email Notifications</span>
                        <label class="toggle-switch">
                            <input type="checkbox" checked>
                            <span class="slider"></span>
                        </label>
                    </label>
                    <p class="form-text">Receive important updates via email</p>
                </div>
                
                <div class="form-group">
                    <label class="toggle-label">
                        <span>New Investment Opportunities</span>
                        <label class="toggle-switch">
                            <input type="checkbox" checked>
                            <span class="slider"></span>
                        </label>
                    </label>
                </div>
                
                <div class="form-group">
                    <label class="toggle-label">
                        <span>Project Updates</span>
                        <label class="toggle-switch">
                            <input type="checkbox" checked>
                            <span class="slider"></span>
                        </label>
                    </label>
                </div>
                
                <div class="form-group">
                    <label class="toggle-label">
                        <span>Payment Notifications</span>
                        <label class="toggle-switch">
                            <input type="checkbox" checked>
                            <span class="slider"></span>
                        </label>
                    </label>
                </div>
                
                <div class="form-group">
                    <label class="toggle-label">
                        <span>Marketing Communications</span>
                        <label class="toggle-switch">
                            <input type="checkbox">
                            <span class="slider"></span>
                        </label>
                    </label>
                    <p class="form-text">Receive newsletters and promotional offers</p>
                </div>
                
                <button class="btn btn-primary">Save Preferences</button>
            </div>

            <!-- Security Settings -->
            <div class="settings-section" id="security-section">
                <h3 class="section-title">Security Settings</h3>
                
                <div class="form-group">
                    <label class="form-label">Change Password</label>
                    <input type="password" class="form-control" placeholder="Current Password">
                    <input type="password" class="form-control" placeholder="New Password" style="margin-top: 0.5rem;">
                    <input type="password" class="form-control" placeholder="Confirm New Password" style="margin-top: 0.5rem;">
                    <p class="form-text">Use at least 8 characters with a mix of letters, numbers & symbols</p>
                </div>
                
                <div class="form-group">
                    <label class="toggle-label">
                        <span>Two-Factor Authentication</span>
                        <label class="toggle-switch">
                            <input type="checkbox">
                            <span class="slider"></span>
                        </label>
                    </label>
                    <p class="form-text">Add an extra layer of security to your account</p>
                </div>
                
                <div class="form-group">
                    <label class="form-label">Active Sessions</label>
                    <div style="background: rgba(255,255,255,0.05); padding: 1rem; border-radius: 8px;">
                        <div style="display: flex; justify-content: space-between; margin-bottom: 0.5rem;">
                            <span>Chrome on Windows (Current)</span>
                            <a href="#" style="color: var(--studio-blue);">Log out</a>
                        </div>
                        <div style="display: flex; justify-content: space-between;">
                            <span>Safari on iPhone (2 days ago)</span>
                            <a href="#" style="color: var(--studio-blue);">Log out</a>
                        </div>
                    </div>
                </div>
                
                <button class="btn btn-primary">Update Security Settings</button>
            </div>

            <!-- Payment Methods -->
            <div class="settings-section" id="payment-section">
                <h3 class="section-title">Payment Methods</h3>
                
                <div style="background: rgba(255,255,255,0.05); padding: 1.5rem; border-radius: 12px; margin-bottom: 1.5rem;">
                    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 1rem;">
                        <div style="display: flex; align-items: center; gap: 1rem;">
                            <i class="fab fa-cc-visa" style="font-size: 1.8rem; color: var(--studio-blue);"></i>
                            <div>
                                <div>VISA ending in 4242</div>
                                <div style="font-size: 0.9rem; opacity: 0.7;">Expires 04/2025</div>
                            </div>
                        </div>
                        <a href="#" style="color: var(--investor-pink);">Remove</a>
                    </div>
                    <div style="display: flex; justify-content: space-between; align-items: center;">
                        <div style="display: flex; align-items: center; gap: 1rem;">
                            <i class="fas fa-university" style="font-size: 1.8rem; color: var(--filmmaker-orange);"></i>
                            <div>
                                <div>Bank Account (ACH)</div>
                                <div style="font-size: 0.9rem; opacity: 0.7;">•••• 6789</div>
                            </div>
                        </div>
                        <a href="#" style="color: var(--investor-pink);">Remove</a>
                    </div>
                </div>
                
                <button class="btn btn-outline" style="margin-bottom: 1.5rem;">
                    <i class="fas fa-plus"></i> Add Payment Method
                </button>
                
                <h3 class="section-title">Payout Preferences</h3>
                
                <div class="form-group">
                    <label class="form-label">Default Payout Method</label>
                    <select class="form-control">
                        <option>Bank Transfer (ACH)</option>
                        <option>PayPal</option>
                        <option>Check by Mail</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label class="form-label">Tax Information</label>
                    <input type="text" class="form-control" placeholder="Social Security Number or EIN">
                    <p class="form-text">Required for IRS reporting on investment income</p>
                </div>
                
                <button class="btn btn-primary">Update Payment Settings</button>
            </div>
        </main>
    </div>

    <script>
        // Tab Switching Functionality
        const tabs = document.querySelectorAll('.tab');
        tabs.forEach(tab => {
            tab.addEventListener('click', () => {
                // Remove active class from all tabs
                tabs.forEach(t => t.classList.remove('active'));
                
                // Add active class to clicked tab
                tab.classList.add('active');
                
                // Hide all sections
                document.querySelectorAll('.settings-section').forEach(section => {
                    section.classList.remove('active');
                });
                
                // Show corresponding section
                const tabId = tab.getAttribute('data-tab');
                document.getElementById(`${tabId}-section`).classList.add('active');
            });
        });

        // Form Submission Handling (would be more robust in a real app)
        document.querySelectorAll('.btn-primary').forEach(btn => {
            btn.addEventListener('click', () => {
                const parentSection = btn.closest('.settings-section');
                const sectionTitle = parentSection.querySelector('.section-title').textContent;
                alert(`${sectionTitle} have been updated successfully!`);
            });
        });
    </script>
</body>
</html> 