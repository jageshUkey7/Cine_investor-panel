<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cinevestor | My Projects</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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

        @keyframes zoomIn {
            from { transform: scale(0.95); opacity: 0; }
            to { transform: scale(1); opacity: 1; }
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }

        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
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

        /* ==== PROJECTS PAGE ==== */
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

        .btn i {
            margin-right: 0.7rem;
            font-size: 1.1rem;
        }

        /* ==== PROJECT CARDS ==== */
        .projects-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(380px, 1fr));
            gap: 2rem;
        }

        .project-card {
            background: rgba(31, 27, 58, 0.7);
            border-radius: 16px;
            padding: 2rem;
            border: 1px solid rgba(255, 137, 6, 0.3);
            transition: all 0.4s ease;
            animation: fadeIn 0.6s ease-out;
            position: relative;
            overflow: hidden;
            backdrop-filter: blur(5px);
        }

        .project-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 5px;
            height: 100%;
            background: var(--gradient);
            animation: gradientBG 6s ease infinite;
            background-size: 400% 400%;
        }

        .project-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.4);
            border-color: var(--filmmaker-orange);
        }

        .project-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 1.5rem;
            cursor: pointer;
        }

        .project-icon {
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

        .project-card:hover .project-icon {
            background: var(--gradient);
            color: white;
            transform: rotate(15deg) scale(1.1);
            box-shadow: 0 5px 15px rgba(255, 137, 6, 0.4);
        }

        .project-title {
            font-size: 1.5rem;
            margin-bottom: 0.5rem;
            position: relative;
            display: inline-block;
        }

        .project-title::after {
            content: '';
            position: absolute;
            bottom: -5px;
            left: 0;
            width: 40px;
            height: 2px;
            background: var(--studio-blue);
            transition: all 0.4s ease;
        }

        .project-card:hover .project-title::after {
            width: 100%;
            background: var(--gradient);
        }

        .project-type {
            color: var(--studio-blue);
            font-size: 0.95rem;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
        }

        .project-type i {
            margin-right: 0.5rem;
        }

        .project-status {
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .status-active {
            background: rgba(46, 204, 113, 0.1);
            color: var(--success-green);
            border: 1px solid var(--success-green);
        }

        .status-completed {
            background: rgba(61, 169, 252, 0.1);
            color: var(--studio-blue);
            border: 1px solid var(--studio-blue);
        }

        /* ==== PROJECT DETAILS (DROPDOWN) ==== */
        .project-details {
            display: none;
            grid-template-columns: repeat(2, 1fr);
            gap: 1.2rem;
            margin: 1.5rem 0;
            animation: fadeIn 0.4s ease-out;
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

        /* ==== PROJECT PROGRESS ==== */
        .project-progress {
            margin: 1.5rem 0;
        }

        .progress-bar {
            height: 8px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            overflow: hidden;
            margin-bottom: 0.5rem;
        }

        .progress-fill {
            height: 100%;
            background: var(--gradient);
            animation: gradientBG 4s ease infinite;
            background-size: 200% 200%;
            border-radius: 10px;
            transition: width 1.5s ease;
        }

        .progress-text {
            display: flex;
            justify-content: space-between;
            font-size: 0.85rem;
        }

        /* ==== PROJECT ACTIONS ==== */
        .project-actions {
            display: flex;
            gap: 1.2rem;
            margin-top: 1.5rem;
        }

        .btn-outline {
            background: transparent;
            color: var(--studio-blue);
            border: 1px solid var(--studio-blue);
            flex: 1;
            transition: all 0.3s ease;
        }

        .btn-outline:hover {
            background: rgba(61, 169, 252, 0.1);
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(61, 169, 252, 0.2);
        }

        /* ==== ANALYTICS MODAL (ZOOM) ==== */
        .analytics-modal {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(15, 14, 23, 0.97);
            z-index: 1000;
            display: none;
            align-items: center;
            justify-content: center;
            padding: 2rem;
            animation: zoomIn 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        }

        .analytics-content {
            background: rgba(31, 27, 58, 0.95);
            border-radius: 20px;
            padding: 2.5rem;
            max-width: 1000px;
            width: 100%;
            position: relative;
            border: 1px solid var(--filmmaker-orange);
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.5);
            overflow: hidden;
        }

        .analytics-content::before {
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

        .close-modal {
            position: absolute;
            top: 1.5rem;
            right: 1.5rem;
            width: 45px;
            height: 45px;
            border-radius: 50%;
            background: var(--investor-pink);
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.3s ease;
            font-size: 1.2rem;
            box-shadow: 0 4px 15px rgba(229, 49, 112, 0.3);
        }

        .close-modal:hover {
            transform: rotate(90deg) scale(1.1);
            box-shadow: 0 6px 20px rgba(229, 49, 112, 0.4);
        }

        .analytics-header {
            margin-bottom: 2rem;
            text-align: center;
        }

        .analytics-title {
            font-size: 2rem;
            background: var(--gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 0.5rem;
            animation: gradientBG 6s ease infinite;
            background-size: 200% 200%;
        }

        .analytics-subtitle {
            color: var(--primary-light);
            opacity: 0.8;
        }

        .chart-container {
            height: 350px;
            margin: 2rem 0;
            position: relative;
        }

        .analytics-stats {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 1.5rem;
            margin-top: 2rem;
        }

        .stat-card {
            background: rgba(255, 255, 255, 0.07);
            border-radius: 12px;
            padding: 1.5rem;
            text-align: center;
            transition: all 0.3s ease;
            border: 1px solid rgba(255, 255, 255, 0.05);
        }

        .stat-card:hover {
            transform: translateY(-5px);
            background: rgba(255, 255, 255, 0.1);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
        }

        .stat-value {
            font-size: 1.8rem;
            font-weight: 700;
            margin: 0.5rem 0;
            background: var(--gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            animation: gradientBG 6s ease infinite;
            background-size: 200% 200%;
        }

        .stat-label {
            font-size: 0.9rem;
            opacity: 0.8;
        }

        /* ==== RESPONSIVE DESIGN ==== */
        @media (max-width: 1200px) {
            .analytics-stats {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 992px) {
            .project-details {
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
            
            .projects-grid {
                grid-template-columns: 1fr;
            }

            .analytics-stats {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 576px) {
            .project-actions {
                flex-direction: column;
            }
            
            .btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>

	<%@ include file="header.jsp"%>
	 
		 
        <!-- Main Content -->
        <main class="main-content">
            <div class="page-header">
                <h1 class="page-title">
                    <i class="fas fa-project-diagram"></i>
                    My Film Contributions
                </h1>
                <button class="btn btn-primary" id="add-investment-btn">
                    <i class="fas fa-plus"></i> Add Contributions
                </button>
            </div>

            <div class="projects-grid">
                <!-- Project 1 -->
                <div class="project-card">
                    <div class="project-header" onclick="toggleDetails('project1')">
                        <div>
                            <div class="project-icon">
                                <i class="fas fa-film"></i>
                            </div>
                            <h2 class="project-title">The Last Frontier</h2>
                            <div class="project-type">
                                <i class="fas fa-tag"></i> Feature Film
                            </div>
                        </div>
                        <span class="project-status status-active">Active</span>
                    </div>
                    
                    <div id="project1-details" class="project-details">
                        <div class="detail-card">
                            <div class="detail-label">
                                <i class="fas fa-wallet"></i> Contributions
                            </div>
                            <div class="detail-value">$45,000</div>
                        </div>
                        <div class="detail-card">
                            <div class="detail-label">
                                <i class="fas fa-calendar-alt"></i> Start Date
                            </div>
                            <div class="detail-value">May 12, 2023</div>
                        </div>
                        <div class="detail-card">
                            <div class="detail-label">
                                <i class="fas fa-clock"></i> Duration
                            </div>
                            <div class="detail-value">18 Months</div>
                        </div>
                        <div class="detail-card">
                            <div class="detail-label">
                                <i class="fas fa-chart-line"></i> Projected profit sharing
                            </div>
                            <div class="detail-value" style="color: var(--success-green);">21.5%</div>
                        </div>
                        <div class="detail-card" style="grid-column: span 2;">
                            <div class="detail-label">
                                <i class="fas fa-align-left"></i> Description
                            </div>
                            <div class="detail-value">A sci-fi thriller about humanity's first interstellar colony mission facing unexpected challenges in the Alpha Centauri system.</div>
                        </div>
                    </div>

                    <div class="project-progress">
                        <div class="progress-bar">
                            <div class="progress-fill" style="width: 65%;"></div>
                        </div>
                        <div class="progress-text">
                            <span>Production Progress</span>
                            <span>65%</span>
                        </div>
                    </div>
                    
                    <div class="project-actions">
                        <button class="btn btn-outline" onclick="showAnalytics('project1')">
                            <i class="fas fa-chart-line"></i> View Analytics
                        </button>
                        <button class="btn btn-primary">
                            <i class="fas fa-file-contract"></i> View Contract
                        </button>
                    </div>
                </div>

                <!-- Project 2 -->
                <div class="project-card">
                    <div class="project-header" onclick="toggleDetails('project2')">
                        <div>
                            <div class="project-icon">
                                <i class="fas fa-tv"></i>
                            </div>
                            <h2 class="project-title">Urban Legends</h2>
                            <div class="project-type">
                                <i class="fas fa-tag"></i> TV Series
                            </div>
                        </div>
                        <span class="project-status status-active">Active</span>
                    </div>
                    
                    <div id="project2-details" class="project-details">
                        <div class="detail-card">
                            <div class="detail-label">
                                <i class="fas fa-wallet"></i> Contributions
                            </div>
                            <div class="detail-value">$32,500</div>
                        </div>
                        <div class="detail-card">
                            <div class="detail-label">
                                <i class="fas fa-calendar-alt"></i> Start Date
                            </div>
                            <div class="detail-value">Apr 28, 2023</div>
                        </div>
                        <div class="detail-card">
                            <div class="detail-label">
                                <i class="fas fa-clock"></i> Duration
                            </div>
                            <div class="detail-value">24 Months</div>
                        </div>
                        <div class="detail-card">
                            <div class="detail-label">
                                <i class="fas fa-chart-line"></i> Projected projected profit sharing
                            </div>
                            <div class="detail-value" style="color: var(--success-green);">18.2%</div>
                        </div>
                        <div class="detail-card" style="grid-column: span 2;">
                            <div class="detail-label">
                                <i class="fas fa-align-left"></i> Description
                            </div>
                            <div class="detail-value">An anthology series exploring modern urban myths with a supernatural twist, featuring different directors for each episode.</div>
                        </div>
                    </div>

                    <div class="project-progress">
                        <div class="progress-bar">
                            <div class="progress-fill" style="width: 40%;"></div>
                        </div>
                        <div class="progress-text">
                            <span>Production Progress</span>
                            <span>40%</span>
                        </div>
                    </div>
                    
                    <div class="project-actions">
                        <button class="btn btn-outline" onclick="showAnalytics('project2')">
                            <i class="fas fa-chart-line"></i> View Analytics
                        </button>
                        <button class="btn btn-primary">
                            <i class="fas fa-file-contract"></i> View Contract
                        </button>
                    </div>
                </div>

                <!-- Project 3 -->
                <div class="project-card">
                    <div class="project-header" onclick="toggleDetails('project3')">
                        <div>
                            <div class="project-icon">
                                <i class="fas fa-video"></i>
                            </div>
                            <h2 class="project-title">Silent Echo</h2>
                            <div class="project-type">
                                <i class="fas fa-tag"></i> Short Film
                            </div>
                        </div>
                        <span class="project-status status-completed">Completed</span>
                    </div>
                    
                    <div id="project3-details" class="project-details">
                        <div class="detail-card">
                            <div class="detail-label">
                                <i class="fas fa-wallet"></i> Contributions
                            </div>
                            <div class="detail-value">$25,000</div>
                        </div>
                        <div class="detail-card">
                            <div class="detail-label">
                                <i class="fas fa-calendar-alt"></i> Start Date
                            </div>
                            <div class="detail-value">Mar 15, 2023</div>
                        </div>
                        <div class="detail-card">
                            <div class="detail-label">
                                <i class="fas fa-clock"></i> Duration
                            </div>
                            <div class="detail-value">6 Months</div>
                        </div>
                        <div class="detail-card">
                            <div class="detail-label">
                                <i class="fas fa-chart-line"></i> Final profit sharing
                            </div>
                            <div class="detail-value" style="color: var(--success-green);">22.7%</div>
                        </div>
                        <div class="detail-card" style="grid-column: span 2;">
                            <div class="detail-label">
                                <i class="fas fa-align-left"></i> Description
                            </div>
                            <div class="detail-value">A psychological drama about a musician losing his hearing and his journey to adapt to a silent world, featuring an original score.</div>
                        </div>
                    </div>

                    <div class="project-progress">
                        <div class="progress-bar">
                            <div class="progress-fill" style="width: 100%;"></div>
                        </div>
                        <div class="progress-text">
                            <span>Production Completed</span>
                            <span>100%</span>
                        </div>
                    </div>
                    
                    <div class="project-actions">
                        <button class="btn btn-outline" onclick="showAnalytics('project3')">
                            <i class="fas fa-chart-line"></i> View Report
                        </button>
                        <button class="btn btn-primary">
                            <i class="fas fa-download"></i> Download Assets
                        </button>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <!-- Analytics Modal (Zoom) -->
    <div id="analytics-modal" class="analytics-modal">
        <div class="analytics-content">
            <div class="close-modal" onclick="closeAnalytics()">
                <i class="fas fa-times"></i>
            </div>
            
            <div class="analytics-header">
                <h2 class="analytics-title" id="analytics-title">Project Analytics</h2>
                <div class="analytics-subtitle" id="analytics-subtitle">Detailed performance metrics</div>
            </div>
            
            <div class="chart-container">
                <canvas id="analytics-chart"></canvas>
            </div>
            
            <div class="analytics-stats">
                <div class="stat-card">
                    <div class="stat-label">Total Contributions</div>
                    <div class="stat-value" id="stats-investment">$45,000</div>
                    <div class="stat-label">Initial commitment</div>
                </div>
                <div class="stat-card">
                    <div class="stat-label">Current Value</div>
                    <div class="stat-value" id="stats-current">$54,675</div>
                    <div class="stat-label">Present valuation</div>
                </div>
                <div class="stat-card">
                    <div class="stat-label">Projected profit sharing</div>
                    <div class="stat-value" id="stats-roi">21.5%</div>
                    <div class="stat-label">Annual return</div>
                </div>
                <div class="stat-card">
                    <div class="stat-label">Next Payment</div>
                    <div class="stat-value" id="stats-payment">Aug 15</div>
                    <div class="stat-label">Upcoming distribution</div>
                </div>
            </div>
        </div>
    </div>
 

    <script>
        // Initialize animations
        document.addEventListener('DOMContentLoaded', function() {
            // Animate project cards on load
            anime({
                targets: '.project-card',
                translateY: [20, 0],
                opacity: [0, 1],
                duration: 800,
                delay: anime.stagger(100),
                easing: 'easeOutExpo'
            });

            // Animate progress bars
            anime({
                targets: '.progress-fill',
                width: ['0%', '100%'],
                duration: 1500,
                delay: anime.stagger(200),
                easing: 'easeOutExpo'
            });
        });

        // Toggle project details dropdown
        function toggleDetails(projectId) {
            const details = document.getElementById(`${projectId}-details`);
            const isVisible = details.style.display === 'grid';
            
            if(isVisible) {
                anime({
                    targets: `#${projectId}-details`,
                    opacity: 0,
                    height: 0,
                    duration: 300,
                    easing: 'easeInOutQuad',
                    complete: () => {
                        details.style.display = 'none';
                    }
                });
            } else {
                details.style.display = 'grid';
                anime({
                    targets: `#${projectId}-details`,
                    opacity: [0, 1],
                    height: ['0px', 'auto'],
                    duration: 400,
                    easing: 'easeInOutQuad'
                });
            }
        }

        // Show analytics modal (zoom)
        function showAnalytics(projectId) {
            const modal = document.getElementById('analytics-modal');
            const title = document.getElementById('analytics-title');
            const subtitle = document.getElementById('analytics-subtitle');
            
            // Set title based on project
            const projectTitle = document.querySelector(`#${projectId} .project-title`).textContent;
            title.textContent = `${projectTitle} Analytics`;
            subtitle.textContent = `Detailed performance metrics for ${projectTitle}`;
            
            // Update stats based on project
            if(projectId === 'project1') {
                document.getElementById('stats-investment').textContent = '$45,000';
                document.getElementById('stats-current').textContent = '$54,675';
                document.getElementById('stats-roi').textContent = '21.5%';
                document.getElementById('stats-payment').textContent = 'Aug 15';
                createChart([5, 8, 12, 15, 18, 21], '#ff8906');
            } 
            else if(projectId === 'project2') {
                document.getElementById('stats-investment').textContent = '$32,500';
                document.getElementById('stats-current').textContent = '$38,415';
                document.getElementById('stats-roi').textContent = '18.2%';
                document.getElementById('stats-payment').textContent = 'Jul 28';
                createChart([3, 6, 9, 12, 15, 18], '#e53170');
            }
            else {
                document.getElementById('stats-investment').textContent = '$25,000';
                document.getElementById('stats-current').textContent = '$30,675';
                document.getElementById('stats-roi').textContent = '22.7%';
                document.getElementById('stats-payment').textContent = 'Completed';
                createChart([8, 12, 15, 18, 21, 23], '#3da9fc');
            }
            
            modal.style.display = 'flex';
            document.body.style.overflow = 'hidden';
            
            // Animate modal appearance
            anime({
                targets: '.analytics-content',
                scale: [0.95, 1],
                opacity: [0, 1],
                duration: 500,
                easing: 'easeOutExpo'
            });
        }

        // Close analytics modal
        function closeAnalytics() {
            const modal = document.getElementById('analytics-modal');
            
            anime({
                targets: '.analytics-content',
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

        // Create chart function
        function createChart(data, color) {
            const ctx = document.getElementById('analytics-chart').getContext('2d');
            
            // Destroy previous chart if exists
            if(window.projectChart) {
                window.projectChart.destroy();
            }
            
            const gradient = ctx.createLinearGradient(0, 0, 0, 400);
            gradient.addColorStop(0, `${color}80`);
            gradient.addColorStop(1, `${color}10`);
            
            window.projectChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                    datasets: [{
                        label: 'ROI Growth',
                        data: data,
                        backgroundColor: gradient,
                        borderColor: color,
                        borderWidth: 4,
                        fill: true,
                        tension: 0.4,
                        pointRadius: 0,
                        pointHoverRadius: 6,
                        pointBackgroundColor: color,
                        pointHoverBackgroundColor: '#ffffff',
                        pointBorderWidth: 2,
                        pointHoverBorderWidth: 2,
                        pointHoverBorderColor: color
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: { display: false },
                        tooltip: {
                            backgroundColor: 'rgba(31, 27, 58, 0.9)',
                            titleFont: { size: 14, weight: 'bold' },
                            bodyFont: { size: 12 },
                            borderColor: 'rgba(255, 255, 255, 0.1)',
                            borderWidth: 1,
                            padding: 12,
                            displayColors: false,
                            callbacks: {
                                label: function(context) {
                                    return `ROI: ${context.parsed.y}%`;
                                }
                            }
                        }
                    },
                    scales: {
                        x: {
                            grid: { display: false, drawBorder: false },
                            ticks: { 
                                color: 'rgba(255,255,255,0.7)',
                                font: { size: 12 }
                            }
                        },
                        y: {
                            grid: { 
                                color: 'rgba(255,255,255,0.1)',
                                drawBorder: false
                            },
                            ticks: { 
                                color: 'rgba(255,255,255,0.7)',
                                font: { size: 12 },
                                callback: function(value) {
                                    return value + '%';
                                }
                            }
                        }
                    },
                    interaction: {
                        intersect: false,
                        mode: 'index'
                    }
                }
            });
        }

        // Add Investment button - redirect to Discover page
        document.getElementById('add-investment-btn').addEventListener('click', function() {
            // Animate button click
            anime({
                targets: '#add-investment-btn',
                scale: [1, 1.1, 1],
                duration: 500,
                easing: 'easeInOutQuad'
            });
            
            // Redirect after animation
            setTimeout(() => {
                window.location.href = 'discover.html';
            }, 300);
        });

        // Close modal when clicking outside
        window.onclick = function(event) {
            const modal = document.getElementById('analytics-modal');
            if(event.target === modal) {
                closeAnalytics();
            }
        }
    </script>
</body>
</html>