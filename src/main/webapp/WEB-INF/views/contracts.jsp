
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cinevestor | Contract Management</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/animejs@3.2.1/lib/anime.min.js"></script>
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
            --warning-yellow: #f39c12;
            --gradient: linear-gradient(135deg, var(--filmmaker-orange), var(--investor-pink));
            --sidebar-width: 280px;
            --contract-signed: #2ecc71;
            --contract-pending: #f39c12;
            --contract-expired: #e74c3c;
            --contract-draft: #3498db;
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

        /* ==== ANIMATIONS ==== */
        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes slideIn {
            from { transform: translateX(-20px); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }

        /* ==== LAYOUT STRUCTURE ==== */
        .app-container {
            display: flex;
            min-height: 100vh;
        }

        
        .main-content {
            margin-left: 18rem;
            flex: 1;
            padding: 2rem;
            max-width: calc(100% - var(--sidebar-width));
        }

        /* ==== CONTRACT PAGE ==== */
        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
            animation: fadeIn 0.6s ease-out;
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
            animation: float 4s ease-in-out infinite;
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

        /* ==== CONTRACT FILTERS ==== */
        .filters-container {
            display: flex;
            gap: 1rem;
            margin-bottom: 2rem;
            flex-wrap: wrap;
        }

        .filter-btn {
            padding: 0.7rem 1.5rem;
            border-radius: 20px;
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            color: var(--primary-light);
            cursor: pointer;
            transition: all 0.3s ease;
            font-size: 0.9rem;
        }

        .filter-btn:hover {
            background: rgba(255, 137, 6, 0.1);
            border-color: var(--filmmaker-orange);
        }

        .filter-btn.active {
            background: var(--gradient);
            color: white;
            border-color: transparent;
            box-shadow: 0 4px 15px rgba(229, 49, 112, 0.3);
        }

        /* ==== CONTRACT CARDS ==== */
        .contracts-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
            gap: 2rem;
        }

        .contract-card {
            background: rgba(31, 27, 58, 0.7);
            border-radius: 16px;
            padding: 2rem;
            border: 1px solid rgba(255, 255, 255, 0.1);
            transition: all 0.4s ease;
            animation: fadeIn 0.6s ease-out;
            position: relative;
            overflow: hidden;
            backdrop-filter: blur(5px);
        }

        .contract-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 5px;
            height: 100%;
            background: var(--gradient);
        }

        .contract-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.4);
            border-color: var(--filmmaker-orange);
        }

        .contract-status {
            position: absolute;
            top: 1rem;
            right: 1rem;
            padding: 0.3rem 0.8rem;
            border-radius: 20px;
            font-size: 0.7rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .status-signed {
            background: rgba(46, 204, 113, 0.2);
            color: var(--contract-signed);
        }

        .status-pending {
            background: rgba(243, 156, 18, 0.2);
            color: var(--contract-pending);
        }

        .status-expired {
            background: rgba(231, 76, 60, 0.2);
            color: var(--contract-expired);
        }

        .status-draft {
            background: rgba(52, 152, 219, 0.2);
            color: var(--contract-draft);
        }

        .contract-header {
            margin-bottom: 1.5rem;
        }

        .contract-icon {
            width: 60px;
            height: 60px;
            border-radius: 15px;
            background: rgba(255, 137, 6, 0.1);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--filmmaker-orange);
            font-size: 1.8rem;
            margin-bottom: 1.5rem;
            transition: all 0.4s ease;
        }

        .contract-card:hover .contract-icon {
            background: var(--gradient);
            color: white;
            transform: rotate(15deg) scale(1.1);
            box-shadow: 0 5px 15px rgba(255, 137, 6, 0.4);
        }

        .contract-title {
            font-size: 1.5rem;
            margin-bottom: 0.5rem;
            position: relative;
            display: inline-block;
        }

        .contract-title::after {
            content: '';
            position: absolute;
            bottom: -5px;
            left: 0;
            width: 40px;
            height: 2px;
            background: var(--studio-blue);
            transition: all 0.4s ease;
        }

        .contract-card:hover .contract-title::after {
            width: 100%;
            background: var(--gradient);
        }

        .contract-project {
            color: var(--studio-blue);
            font-size: 0.95rem;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
        }

        .contract-project i {
            margin-right: 0.5rem;
        }

        /* ==== CONTRACT DETAILS ==== */
        .contract-details {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1.2rem;
            margin: 1.5rem 0;
        }

        .detail-card {
            background: rgba(255, 255, 255, 0.07);
            padding: 1.2rem;
            border-radius: 10px;
            transition: all 0.3s ease;
            border: 1px solid rgba(255, 255, 255, 0.05);
        }

        .detail-card:hover {
            transform: translateY(-3px);
            background: rgba(255, 255, 255, 0.1);
            border-color: rgba(255, 137, 6, 0.2);
        }

        .detail-label {
            font-size: 0.85rem;
            opacity: 0.8;
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
        }

        .detail-label i {
            margin-right: 0.5rem;
            font-size: 0.9rem;
        }

        .detail-value {
            font-size: 1.2rem;
            font-weight: 600;
        }

        /* ==== ACTION BUTTONS ==== */
        .action-buttons {
            display: flex;
            gap: 1.2rem;
            margin-top: 1.5rem;
        }

        .btn {
            padding: 0.9rem 1.8rem;
            border-radius: 10px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            border: none;
            display: inline-flex;
            align-items: center;
            position: relative;
            overflow: hidden;
            flex: 1;
            justify-content: center;
        }

        .btn-primary {
            background: var(--gradient);
            color: white;
            background-size: 200% 200%;
            animation: gradientBG 4s ease infinite;
            box-shadow: 0 4px 20px rgba(229, 49, 112, 0.3);
        }

        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 25px rgba(229, 49, 112, 0.4);
        }

        .btn-outline {
            background: transparent;
            color: var(--studio-blue);
            border: 1px solid var(--studio-blue);
            transition: all 0.3s ease;
        }

        .btn-outline:hover {
            background: rgba(61, 169, 252, 0.1);
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(61, 169, 252, 0.2);
        }

        .btn i {
            margin-right: 0.7rem;
            font-size: 1.1rem;
        }

        /* ==== MODAL ==== */
        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(15, 14, 23, 0.95);
            z-index: 1000;
            display: none;
            align-items: center;
            justify-content: center;
            padding: 2rem;
            animation: zoomIn 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        }

        .modal-content {
            background: rgba(31, 27, 58, 0.95);
            border-radius: 20px;
            padding: 2.5rem;
            max-width: 800px;
            width: 100%;
            position: relative;
            border: 1px solid var(--filmmaker-orange);
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.5);
        }

        .modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
        }

        .modal-title {
            font-size: 1.8rem;
            background: var(--gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .modal-close {
            background: transparent;
            border: none;
            color: var(--primary-light);
            font-size: 1.5rem;
            cursor: pointer;
            opacity: 0.7;
            transition: all 0.3s ease;
        }

        .modal-close:hover {
            opacity: 1;
            transform: rotate(90deg);
        }

        .contract-viewer {
            height: 500px;
            overflow-y: auto;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 10px;
            padding: 1.5rem;
            margin-bottom: 1.5rem;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .contract-viewer h3 {
            color: var(--filmmaker-orange);
            margin: 1.5rem 0 0.5rem;
        }

        .contract-viewer p {
            margin-bottom: 1rem;
            line-height: 1.6;
        }

        .contract-viewer ul {
            margin-left: 1.5rem;
            margin-bottom: 1.5rem;
        }

        .signature-area {
            margin-top: 2rem;
            padding-top: 2rem;
            border-top: 1px dashed rgba(255, 255, 255, 0.2);
        }

        .signature-line {
            display: flex;
            justify-content: space-between;
            margin-top: 2rem;
        }

        .signature-box {
            width: 45%;
            border-bottom: 1px solid rgba(255, 255, 255, 0.3);
            padding-bottom: 0.5rem;
            margin-bottom: 1.5rem;
        }

        .signature-label {
            font-size: 0.8rem;
            opacity: 0.7;
            margin-bottom: 0.5rem;
        }

        /* ==== RESPONSIVE DESIGN ==== */
        @media (max-width: 1200px) {
            .contracts-grid {
                grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            }
        }

        @media (max-width: 992px) {
            .contract-details {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 768px) {
            .sidebar-space {
                width: 80px;
            }
            
            .main-content {
                max-width: calc(100% - 80px);
                padding: 1.5rem;
            }
            
            .filters-container {
                flex-direction: column;
            }
            
            .filter-btn {
                width: 100%;
                text-align: center;
            }
        }

        @media (max-width: 576px) {
            .action-buttons {
                flex-direction: column;
            }
            
            .btn {
                width: 100%;
            }
            
            .signature-line {
                flex-direction: column;
            }
            
            .signature-box {
                width: 100%;
                margin-bottom: 1rem;
            }
        }
    </style>
</head>
<body>
    <%@ include file="header.jsp" %>
    <div class="app-container">
        <!-- Empty space where sidebar would be -->
        <div class="sidebar-space"></div>

        <!-- Main Content -->
        <main class="main-content">
            <div class="page-header">
                <h1 class="page-title">
                    <i class="fas fa-file-contract"></i>
                    Contract Management
                </h1>
                <div class="filters-container">
                    <button class="filter-btn active">All Contracts</button>
                    <button class="filter-btn">Signed</button>
                    <button class="filter-btn">Pending</button>
                    <button class="filter-btn">Drafts</button>
                    <button class="filter-btn">Expired</button>
                </div>
            </div>

            <div class="contracts-grid">
                <!-- Contract 1 -->
                <div class="contract-card">
                    <span class="contract-status status-signed">Signed</span>
                    
                    <div class="contract-header">
                        <div class="contract-icon">
                            <i class="fas fa-file-signature"></i>
                        </div>
                        <h2 class="contract-title">supporter Agreement</h2>
                        <div class="contract-project">
                            <i class="fas fa-film"></i> Cosmic Journey
                        </div>
                    </div>
                    
                    <div class="contract-details">
                        <div class="detail-card">
                            <div class="detail-label">
                                <i class="fas fa-calendar-alt"></i> Signed Date
                            </div>
                            <div class="detail-value">Mar 18, 2023</div>
                        </div>
                        <div class="detail-card">
                            <div class="detail-label">
                                <i class="fas fa-money-bill-wave"></i> Amount
                            </div>
                            <div class="detail-value">$25,000</div>
                        </div>
                        <div class="detail-card">
                            <div class="detail-label">
                                <i class="fas fa-percentage"></i> ROI Terms
                            </div>
                            <div class="detail-value">22-28%</div>
                        </div>
                        <div class="detail-card">
                            <div class="detail-label">
                                <i class="fas fa-hourglass-end"></i> Duration
                            </div>
                            <div class="detail-value">24 Months</div>
                        </div>
                    </div>
                    
                    <div class="action-buttons">
                        <button class="btn btn-outline" onclick="viewContract('Cosmic Journey Investment Agreement')">
                            <i class="fas fa-eye"></i> View
                        </button>
                        <button class="btn btn-primary" onclick="downloadContract('Cosmic Journey Investment Agreement')">
                            <i class="fas fa-download"></i> Download
                        </button>
                    </div>
                </div>

                <!-- Contract 2 -->
                <div class="contract-card">
                    <span class="contract-status status-pending">Pending</span>
                    
                    <div class="contract-header">
                        <div class="contract-icon">
                            <i class="fas fa-file-alt"></i>
                        </div>
                        <h2 class="contract-title">Revenue Share</h2>
                        <div class="contract-project">
                            <i class="fas fa-tv"></i> Urban Legends S2
                        </div>
                    </div>
                    
                    <div class="contract-details">
                        <div class="detail-card">
                            <div class="detail-label">
                                <i class="fas fa-calendar-alt"></i> Created Date
                            </div>
                            <div class="detail-value">Jan 12, 2023</div>
                        </div>
                        <div class="detail-card">
                            <div class="detail-label">
                                <i class="fas fa-money-bill-wave"></i> Amount
                            </div>
                            <div class="detail-value">$15,000</div>
                        </div>
                        <div class="detail-card">
                            <div class="detail-label">
                                <i class="fas fa-percentage"></i> Revenue Share
                            </div>
                            <div class="detail-value">18%</div>
                        </div>
                        <div class="detail-card">
                            <div class="detail-label">
                                <i class="fas fa-hourglass-end"></i> Duration
                            </div>
                            <div class="detail-value">18 Months</div>
                        </div>
                    </div>
                    
                    <div class="action-buttons">
                        <button class="btn btn-outline" onclick="viewContract('Urban Legends Revenue Share')">
                            <i class="fas fa-eye"></i> Review
                        </button>
                        <button class="btn btn-primary" onclick="signContract('Urban Legends Revenue Share')">
                            <i class="fas fa-signature"></i> Sign Now
                        </button>
                    </div>
                </div>

                <!-- Contract 3 -->
                <div class="contract-card">
                    <span class="contract-status status-draft">Draft</span>
                    
                    <div class="contract-header">
                        <div class="contract-icon">
                            <i class="fas fa-file-edit"></i>
                        </div>
                        <h2 class="contract-title">Contribution Terms</h2>
                        <div class="contract-project">
                            <i class="fas fa-video"></i> Neon Dreams
                        </div>
                    </div>
                    
                    <div class="contract-details">
                        <div class="detail-card">
                            <div class="detail-label">
                                <i class="fas fa-calendar-alt"></i> Created Date
                            </div>
                            <div class="detail-value">Feb 28, 2023</div>
                        </div>
                        <div class="detail-card">
                            <div class="detail-label">
                                <i class="fas fa-money-bill-wave"></i> Amount
                            </div>
                            <div class="detail-value">$7,500</div>
                        </div>
                        <div class="detail-card">
                            <div class="detail-label">
                                <i class="fas fa-percentage"></i> profit sharing terms
                            </div>
                            <div class="detail-value">15-20%</div>
                        </div>
                        <div class="detail-card">
                            <div class="detail-label">
                                <i class="fas fa-hourglass-end"></i> Duration
                            </div>
                            <div class="detail-value">12 Months</div>
                        </div>
                    </div>
                    
                    <div class="action-buttons">
                        <button class="btn btn-outline" onclick="viewContract('Neon Dreams Investment Terms')">
                            <i class="fas fa-eye"></i> Review
                        </button>
                        <button class="btn btn-primary" onclick="requestChanges('Neon Dreams Investment Terms')">
                            <i class="fas fa-comment-alt"></i> Request Changes
                        </button>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <!-- Contract Modal -->
    <div id="contract-modal" class="modal-overlay">
        <div class="modal-content">
            <div class="modal-header">
                <h2 class="modal-title" id="contract-modal-title">Contract Title</h2>
                <button class="modal-close" onclick="closeModal()">
                    <i class="fas fa-times"></i>
                </button>
            </div>
            
            <div class="contract-viewer" id="contract-content">
                <h3>Contibutions AGREEMENT</h3>
                <p>This Contribution Agreement ("Agreement") is made and entered into as of <strong id="contract-date">[Date]</strong> by and between:</p>
                
                <p><strong>Contributor:</strong> [Your Name]</p>
                <p><strong>Production Company:</strong> <span id="contract-company">[Production Company]</span></p>
                
                <h3>1.Contributions TERMS</h3>
                <p>The Investor agrees to invest the sum of <strong id="contract-amount">[Amount]</strong> in the production of the film project titled "<strong id="contract-project">[Project Title]</strong>".</p>
                
                <h3>2. profit sharing </h3>
                <p>The supporter shall receive a profit sharing of <strong id="contract-roi">[ROI Percentage]</strong> of the net profits from the project, payable according to the following schedule:</p>
                <ul>
                    <li>First payment: Within 30 days of first revenue receipt</li>
                    <li>Subsequent payments: Quarterly distributions</li>
                    <li>Final payment: Upon project completion or <span id="contract-duration">[Duration]</span> months from signing, whichever comes first</li>
                </ul>
                
                <h3>3. RIGHTS AND OBLIGATIONS</h3>
                <p>The supporter acknowledges that all creative control remains with the Production Company. The supporter shall have no rights to creative decisions but will receive regular financial reports.</p>
                
                <h3>4. TERMINATION</h3>
                <p>This Agreement may be terminated by mutual consent or in the event of force majeure. In such cases, any recovered funds will be distributed proportionally to investors.</p>
                
                <div class="signature-area">
                    <h3>ACCEPTANCE AND AGREEMENT</h3>
                    <p>The parties hereto have executed this Agreement as of the date first written above.</p>
                    
                    <div class="signature-line">
                        <div class="signature-box">
                            <div class="signature-label">supporter Signature</div>
                            <div id="investor-signature">[Electronically Signed]</div>
                        </div>
                        <div class="signature-box">
                            <div class="signature-label">Production Company Representative</div>
                            <div id="company-signature">[Electronically Signed]</div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="action-buttons">
                <button class="btn btn-outline" onclick="closeModal()">
                    <i class="fas fa-times"></i> Close
                </button>
                <button class="btn btn-primary" id="modal-primary-btn">
                    <i class="fas fa-download"></i> Download PDF
                </button>
            </div>
        </div>
    </div>

    <script>
        // Initialize animations
        document.addEventListener('DOMContentLoaded', function() {
            // Animate contract cards on load
            anime({
                targets: '.contract-card',
                translateY: [20, 0],
                opacity: [0, 1],
                duration: 800,
                delay: anime.stagger(100),
                easing: 'easeOutExpo'
            });

            // Animate filter buttons
            anime({
                targets: '.filter-btn',
                translateX: [-10, 0],
                opacity: [0, 1],
                duration: 600,
                delay: anime.stagger(100),
                easing: 'easeOutExpo'
            });
        });

        // View contract function
        function viewContract(contractTitle) {
            const modal = document.getElementById('contract-modal');
            const title = document.getElementById('contract-modal-title');
            const primaryBtn = document.getElementById('modal-primary-btn');
            
            title.textContent = contractTitle;
            
            // Set contract details based on which contract was clicked
            if (contractTitle.includes('Cosmic Journey')) {
                document.getElementById('contract-date').textContent = 'March 18, 2023';
                document.getElementById('contract-company').textContent = 'Stellar Pictures';
                document.getElementById('contract-amount').textContent = '$25,000';
                document.getElementById('contract-project').textContent = 'Cosmic Journey (Feature Film)';
                document.getElementById('contract-roi').textContent = '22-28%';
                document.getElementById('contract-duration').textContent = '24';
                document.getElementById('investor-signature').innerHTML = '<i class="fas fa-check-circle" style="color: var(--success-green);"></i> Signed: Mar 18, 2023';
                document.getElementById('company-signature').innerHTML = '<i class="fas fa-check-circle" style="color: var(--success-green);"></i> Signed: Mar 15, 2023';
                primaryBtn.innerHTML = '<i class="fas fa-download"></i> Download PDF';
                primaryBtn.onclick = function() { downloadContract(contractTitle); };
            } else if (contractTitle.includes('Urban Legends')) {
                document.getElementById('contract-date').textContent = 'January 12, 2023';
                document.getElementById('contract-company').textContent = 'Dark Mirror Studios';
                document.getElementById('contract-amount').textContent = '$15,000';
                document.getElementById('contract-project').textContent = 'Urban Legends S2 (TV Series)';
                document.getElementById('contract-roi').textContent = '18% revenue share';
                document.getElementById('contract-duration').textContent = '18';
                document.getElementById('investor-signature').textContent = '[Pending Signature]';
                document.getElementById('company-signature').innerHTML = '<i class="fas fa-check-circle" style="color: var(--success-green);"></i> Signed: Jan 10, 2023';
                primaryBtn.innerHTML = '<i class="fas fa-signature"></i> Sign Now';
                primaryBtn.onclick = function() { signContract(contractTitle); };
            } else if (contractTitle.includes('Neon Dreams')) {
                document.getElementById('contract-date').textContent = 'February 28, 2023';
                document.getElementById('contract-company').textContent = 'Indie Vision Films';
                document.getElementById('contract-amount').textContent = '$7,500';
                document.getElementById('contract-project').textContent = 'Neon Dreams (Short Film)';
                document.getElementById('contract-roi').textContent = '15-20%';
                document.getElementById('contract-duration').textContent = '12';
                document.getElementById('investor-signature').textContent = '[Draft - Not Signed]';
                document.getElementById('company-signature').textContent = '[Draft - Not Signed]';
                primaryBtn.innerHTML = '<i class="fas fa-comment-alt"></i> Request Changes';
                primaryBtn.onclick = function() { requestChanges(contractTitle); };
            }
            
            modal.style.display = 'flex';
            document.body.style.overflow = 'hidden';
            
            // Animate modal appearance
            anime({
                targets: '.modal-content',
                scale: [0.95, 1],
                opacity: [0, 1],
                duration: 500,
                easing: 'easeOutExpo'
            });
        }

        // Download contract function
        function downloadContract(contractTitle) {
            // In a real app, this would generate or fetch a PDF
            alert(`Downloading ${contractTitle} as PDF...`);
            
            // For demo purposes, we'll just close the modal after a short delay
            setTimeout(() => {
                closeModal();
            }, 1000);
        }

        // Sign contract function
        function signContract(contractTitle) {
            // In a real app, this would initiate an e-signature process
            document.getElementById('investor-signature').innerHTML = '<i class="fas fa-check-circle" style="color: var(--success-green);"></i> Signed: ' + new Date().toLocaleDateString();
            
            // Update the button
            const primaryBtn = document.getElementById('modal-primary-btn');
            primaryBtn.innerHTML = '<i class="fas fa-download"></i> Download PDF';
            primaryBtn.onclick = function() { downloadContract(contractTitle); };
            
            // Show success message
            alert(`You've successfully signed the ${contractTitle}!`);
        }

        // Request changes function
        function requestChanges(contractTitle) {
            const changes = prompt(`What changes would you like to request for ${contractTitle}?`);
            if (changes) {
                alert(`Your change request has been sent to the production company.\n\nRequest: ${changes}`);
                closeModal();
            }
        }

        // Close modal
        function closeModal() {
            const modal = document.getElementById('contract-modal');
            
            anime({
                targets: '.modal-content',
                scale: 0.95,
                opacity: 0,
                duration: 300,
                easing: 'easeInExpo',
                complete: () => {
                    modal.style.display = 'none';
                    document.body.style.overflow = 'auto';
                }
            });
        }

        // Filter functionality
        const filterBtns = document.querySelectorAll('.filter-btn');
        filterBtns.forEach(btn => {
            btn.addEventListener('click', function() {
                filterBtns.forEach(b => b.classList.remove('active'));
                this.classList.add('active');
                
                // Here you would typically filter the contracts
                // For this demo, we'll just animate the cards
                anime({
                    targets: '.contract-card',
                    translateY: [20, 0],
                    opacity: [0, 1],
                    duration: 600,
                    delay: anime.stagger(100),
                    easing: 'easeOutExpo'
                });
            });
        });

        // Close modal when clicking outside
        window.onclick = function(event) {
            const modal = document.getElementById('contract-modal');
            if(event.target === modal) {
                closeModal();
            }
        }
    </script>
</body>
</html>