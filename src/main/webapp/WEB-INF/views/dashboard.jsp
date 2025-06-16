<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cinevestor | Premium Investor Dashboard</title>
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
            --glass: rgba(255, 255, 255, 0.08);
            --sidebar-width: 280px;
        }

        @keyframes filmReelSpin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        @keyframes spotlightFocus {
            0% { box-shadow: 0 0 0 0 rgba(61, 169, 252, 0.4); }
            100% { box-shadow: 0 0 20px 10px rgba(61, 169, 252, 0); }
        }

        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes shimmer {
            0% { background-position: -1000px 0; }
            100% { background-position: 1000px 0; }
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
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
            display: flex;
            min-height: 100vh;
            overflow-x: hidden;
            background-image: 
                radial-gradient(circle at 20% 30%, rgba(255, 137, 6, 0.1) 0%, transparent 30%),
                radial-gradient(circle at 80% 70%, rgba(229, 49, 112, 0.1) 0%, transparent 30%),
                url('https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            background-blend-mode: overlay;
            background-color: rgba(15, 14, 23, 0.9);
        }

        .sidebar {
            width: var(--sidebar-width);
            height: 100vh;
            background: rgba(15, 14, 23, 0.85);
            backdrop-filter: blur(10px);
            border-right: 1px solid rgba(255, 137, 6, 0.2);
            padding: 2rem 1.5rem;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 100;
            overflow-y: auto;
            transition: all 0.3s ease;
        }

        .sidebar::before {
            content: '';
            position: absolute;
            top: 0;
            right: 0;
            width: 4px;
            height: 100%;
            background: var(--gradient);
        }

        .logo-container {
            display: flex;
            align-items: center;
            margin-bottom: 2rem;
            padding-bottom: 1.5rem;
            border-bottom: 1px solid rgba(255, 137, 6, 0.3);
        }

        .logo-icon {
            font-size: 2rem;
            margin-right: 1rem;
            color: var(--filmmaker-orange);
            animation: filmReelSpin 10s linear infinite;
        }

        .logo-text {
            font-size: 1.5rem;
            font-weight: 700;
            background: var(--gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .search-container {
            position: relative;
            margin-bottom: 2rem;
        }

        .search-bar {
            width: 100%;
            padding: 0.8rem 1rem 0.8rem 2.5rem;
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 137, 6, 0.2);
            border-radius: 8px;
            color: var(--primary-light);
            font-size: 0.9rem;
            transition: all 0.3s ease;
        }

        .search-bar:focus {
            outline: none;
            border-color: var(--filmmaker-orange);
            box-shadow: 0 0 0 3px rgba(255, 137, 6, 0.2);
        }

        .search-icon {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: var(--filmmaker-orange);
        }

        .user-profile {
            text-align: center;
            margin-bottom: 2rem;
            animation: fadeIn 0.8s ease-out;
        }

        .user-avatar {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            background: var(--gradient);
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1rem;
            color: white;
            font-size: 1.8rem;
            font-weight: 600;
            border: 3px solid var(--studio-blue);
            box-shadow: 0 0 20px rgba(61, 169, 252, 0.3);
            animation: float 6s ease-in-out infinite;
            transition: all 0.3s ease;
        }

        .user-avatar:hover {
            transform: scale(1.1) translateY(-5px);
            box-shadow: 0 0 30px rgba(61, 169, 252, 0.5);
        }

        .user-name {
            font-size: 1.2rem;
            margin-bottom: 0.5rem;
            color: var(--primary-light);
        }

        .user-role {
            display: inline-block;
            padding: 0.3rem 1rem;
            background: rgba(229, 49, 112, 0.2);
            color: var(--investor-pink);
            border-radius: 20px;
            font-size: 0.8rem;
            border: 1px solid var(--investor-pink);
            transition: all 0.3s ease;
        }

        .user-role:hover {
            background: rgba(229, 49, 112, 0.3);
            transform: translateY(-2px);
        }

        .nav-menu {
            list-style: none;
        }

        .nav-item {
            margin-bottom: 0.5rem;
            position: relative;
        }

        .nav-link {
            display: flex;
            align-items: center;
            padding: 0.8rem 1rem;
            color: var(--primary-light);
            text-decoration: none;
            border-radius: 6px;
            transition: all 0.3s ease;
        }

        .nav-link:hover {
            background: rgba(255, 137, 6, 0.1);
            transform: translateX(5px);
        }

        .nav-link.active {
            background: rgba(229, 49, 112, 0.2);
            color: var(--primary-light);
            font-weight: 500;
        }

        .nav-link i {
            font-size: 1.1rem;
            margin-right: 1rem;
            width: 20px;
            text-align: center;
        }

        .nav-link.active i {
            color: var(--filmmaker-orange);
        }

        .notification-badge {
            margin-left: auto;
            background: var(--investor-pink);
            color: white;
            width: 20px;
            height: 20px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.7rem;
            font-weight: 600;
            animation: spotlightFocus 1.5s infinite;
        }

        .main-content {
            flex: 1;
            margin-left: var(--sidebar-width);
            padding: 2.5rem;
            min-height: 100vh;
            background: rgba(15, 14, 23, 0.7);
            backdrop-filter: blur(5px);
            transition: all 0.3s ease;
        }

        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2.5rem;
            padding-bottom: 1.5rem;
            border-bottom: 1px solid rgba(255, 137, 6, 0.3);
        }

        .header-title {
            font-size: 2rem;
            font-weight: 700;
            display: flex;
            align-items: center;
            color: var(--primary-light);
            background: linear-gradient(to right, var(--primary-light), var(--studio-blue));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            animation: shimmer 3s linear infinite;
            background-size: 200% auto;
        }

        .header-title i {
            margin-right: 1rem;
            color: var(--filmmaker-orange);
        }

        .login-status {
            display: flex;
            align-items: center;
            background: rgba(255, 255, 255, 0.1);
            padding: 0.7rem 1.2rem;
            border-radius: 50px;
            font-size: 0.9rem;
            border: 1px solid rgba(255, 137, 6, 0.2);
            transition: all 0.3s ease;
        }

        .login-status:hover {
            background: rgba(255, 255, 255, 0.15);
            transform: translateY(-2px);
        }

        .login-status i {
            color: var(--success-green);
            margin-right: 0.5rem;
            font-size: 0.7rem;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 1.8rem;
            margin-bottom: 2.5rem;
        }

        .stat-card {
            background: rgba(31, 27, 58, 0.6);
            border-radius: 12px;
            padding: 1.8rem;
            border: 1px solid rgba(255, 137, 6, 0.2);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            animation: fadeIn 0.6s ease-out;
        }

        .stat-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 4px;
            height: 100%;
            background: var(--gradient);
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
            border-color: var(--filmmaker-orange);
        }

        .stat-card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
        }

        .stat-card-title {
            font-size: 1.1rem;
            font-weight: 500;
            color: var(--primary-light);
        }

        .stat-card-icon {
            width: 40px;
            height: 40px;
            border-radius: 10px;
            background: rgba(255, 137, 6, 0.1);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--filmmaker-orange);
            font-size: 1.2rem;
            transition: all 0.3s ease;
        }

        .stat-card:hover .stat-card-icon {
            background: var(--gradient);
            color: white;
            transform: rotate(15deg);
        }

        .stat-card-value {
            font-size: 2.2rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
            background: var(--gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .stat-card-description {
            font-size: 0.9rem;
            color: var(--primary-light);
            opacity: 0.8;
        }

        .recent-investments {
            background: rgba(31, 27, 58, 0.6);
            border-radius: 12px;
            padding: 2rem;
            border: 1px solid rgba(255, 137, 6, 0.2);
            transition: all 0.3s ease;
        }

        .recent-investments:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
        }

        .section-title {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--primary-light);
            position: relative;
            padding-bottom: 0.5rem;
        }

        .section-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 50px;
            height: 3px;
            background: var(--gradient);
        }

        .btn {
            padding: 0.8rem 1.5rem;
            border-radius: 8px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            border: none;
            display: inline-flex;
            align-items: center;
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

        .btn i {
            margin-right: 0.5rem;
        }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
        }

        thead th {
            padding: 1rem;
            text-align: left;
            font-weight: 500;
            color: var(--primary-light);
            border-bottom: 1px solid rgba(255, 137, 6, 0.3);
        }

        tbody tr {
            transition: all 0.3s ease;
        }

        tbody tr:hover {
            background: rgba(255, 137, 6, 0.1);
            transform: translateX(5px);
        }

        tbody td {
            padding: 1.2rem 1rem;
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
            color: var(--primary-light);
        }

        .project-info {
            display: flex;
            align-items: center;
        }

        .project-image {
            width: 40px;
            height: 40px;
            border-radius: 8px;
            background: var(--gradient);
            margin-right: 1rem;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.2rem;
            transition: all 0.3s ease;
        }

        tr:hover .project-image {
            transform: rotate(15deg);
            box-shadow: 0 0 15px rgba(255, 137, 6, 0.5);
        }

        .project-type {
            font-size: 0.8rem;
            color: var(--studio-blue);
        }

        .status-badge {
            padding: 0.4rem 0.8rem;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 500;
            display: inline-block;
            transition: all 0.3s ease;
        }

        .status-badge:hover {
            transform: scale(1.1);
        }

        .status-active {
            background: rgba(46, 204, 113, 0.1);
            color: var(--success-green);
            border: 1px solid var(--success-green);
        }

        .status-pending {
            background: rgba(241, 196, 15, 0.1);
            color: #f1c40f;
            border: 1px solid #f1c40f;
        }

        .status-completed {
            background: rgba(52, 152, 219, 0.1);
            color: var(--studio-blue);
            border: 1px solid var(--studio-blue);
        }

        .fab {
            position: fixed;
            bottom: 2rem;
            right: 2rem;
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background: var(--gradient);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            box-shadow: 0 4px 20px rgba(229, 49, 112, 0.4);
            cursor: pointer;
            z-index: 99;
            transition: all 0.3s ease;
            animation: float 3s ease-in-out infinite;
        }

        .fab:hover {
            transform: scale(1.1) translateY(-5px);
            box-shadow: 0 6px 25px rgba(229, 49, 112, 0.6);
        }

        @media (max-width: 1200px) {
            .sidebar {
                width: 250px;
            }
            
            .main-content {
                margin-left: 250px;
            }
        }

        @media (max-width: 992px) {
            .sidebar {
                transform: translateX(-100%);
                z-index: 1000;
            }
            
            .sidebar.active {
                transform: translateX(0);
            }
            
            .main-content {
                margin-left: 0;
            }
            
            .menu-toggle {
                display: block;
                position: fixed;
                top: 1rem;
                left: 1rem;
                z-index: 1001;
                background: var(--gradient);
                color: white;
                width: 50px;
                height: 50px;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.5rem;
                cursor: pointer;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
                transition: all 0.3s ease;
                animation: pulse 2s infinite;
            }

            .menu-toggle:hover {
                transform: scale(1.1);
            }
        }

        @media (max-width: 768px) {
            .stats-grid {
                grid-template-columns: 1fr;
            }
            
            .main-content {
                padding: 1.5rem;
            }
            
            table {
                display: block;
                overflow-x: auto;
            }

            .dashboard-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 1rem;
            }

            .header-title {
                font-size: 1.8rem;
            }
        }

        @media (max-width: 576px) {
            .btn {
                padding: 0.6rem 1rem;
                font-size: 0.9rem;
            }

            .section-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 1rem;
            }
        }
    </style>
</head>
<body>
    <%@ include file="header.jsp"%>

    <!-- Main Content -->
    <main class="main-content">
        <!-- Dashboard Header -->
        <div class="dashboard-header">
            <h1 class="header-title">
                <i class="fas fa-chart-line"></i>
                Investor Dashboard
            </h1>
            <div class="login-status">
                <i class="fas fa-circle"></i>
                Last login: Today, 11:42 AM
            </div>
        </div>

        <!-- Stats Cards Grid -->
        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-card-header">
                    <h3 class="stat-card-title">Your Investment</h3>
                    <div class="stat-card-icon">
                        <i class="fas fa-wallet"></i>
                    </div>
                </div>
                <div class="stat-card-value" id="yourInvestment">$0</div>
                <div class="stat-card-description">+18.5% from last quarter</div>
            </div>
            
            <div class="stat-card">
                <div class="stat-card-header">
                    <h3 class="stat-card-title">Total Investment</h3>
                    <div class="stat-card-icon">
                        <i class="fas fa-coins"></i>
                    </div>
                </div>
                <div class="stat-card-value" id="totalInvestment">$0</div>
                <div class="stat-card-description">+18.5% from last quarter</div>
            </div>

            <div class="stat-card">
                <div class="stat-card-header">
                    <h3 class="stat-card-title">Active Projects</h3>
                    <div class="stat-card-icon">
                        <i class="fas fa-project-diagram"></i>
                    </div>
                </div>
                <div class="stat-card-value">5</div>
                <div class="stat-card-description">$85,000 committed</div>
            </div>

            <div class="stat-card">
                <div class="stat-card-header">
                    <h3 class="stat-card-title">Avg. ROI</h3>
                    <div class="stat-card-icon">
                        <i class="fas fa-chart-line"></i>
                    </div>
                </div>
                <div class="stat-card-value">18.5%</div>
                <div class="stat-card-description">Top 22% of investors</div>
            </div>

            <div class="stat-card">
                <div class="stat-card-header">
                    <h3 class="stat-card-title">New Opportunities</h3>
                    <div class="stat-card-icon">
                        <i class="fas fa-lightbulb"></i>
                    </div>
                </div>
                <div class="stat-card-value">12</div>
                <div class="stat-card-description">Curated for you</div>
            </div>
        </div>

        <!-- Recent Investments Table -->
        <div class="recent-investments">
            <div class="section-header">
                <h2 class="section-title">Recent Investments</h2>
                <button class="btn btn-primary">
                    <i class="fas fa-plus"></i> Add Investment
                </button>
            </div>

            <table>
                <thead>
                    <tr>
                        <th>Project</th>
                        <th>Amount</th>
                        <th>Date</th>
                        <th>Status</th>
                        <th>ROI</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <div class="project-info">
                                <div class="project-image">
                                    <i class="fas fa-film"></i>
                                </div>
                                <div>
                                    <div>The Last Frontier</div>
                                    <div class="project-type">Feature Film</div>
                                </div>
                            </div>
                        </td>
                        <td>$45,000</td>
                        <td>12 May 2023</td>
                        <td><span class="status-badge status-active">Active</span></td>
                        <td>21.5%</td>
                    </tr>
                    <tr>
                        <td>
                            <div class="project-info">
                                <div class="project-image">
                                    <i class="fas fa-tv"></i>
                                </div>
                                <div>
                                    <div>Urban Legends</div>
                                    <div class="project-type">TV Series</div>
                                </div>
                            </div>
                        </td>
                        <td>$32,500</td>
                        <td>28 Apr 2023</td>
                        <td><span class="status-badge status-active">Active</span></td>
                        <td>18.2%</td>
                    </tr>
                    <tr>
                        <td>
                            <div class="project-info">
                                <div class="project-image">
                                    <i class="fas fa-film"></i>
                                </div>
                                <div>
                                    <div>Silent Echo</div>
                                    <div class="project-type">Short Film</div>
                                </div>
                            </div>
                        </td>
                        <td>$25,000</td>
                        <td>15 Mar 2023</td>
                        <td><span class="status-badge status-completed">Completed</span></td>
                        <td>22.7%</td>
                    </tr>
                    <tr>
                        <td>
                            <div class="project-info">
                                <div class="project-image">
                                    <i class="fas fa-video"></i>
                                </div>
                                <div>
                                    <div>Midnight Run</div>
                                    <div class="project-type">Documentary</div>
                                </div>
                            </div>
                        </td>
                        <td>$18,750</td>
                        <td>02 Feb 2023</td>
                        <td><span class="status-badge status-pending">Pending</span></td>
                        <td>-</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </main>

    <!-- Floating Action Button -->
    <div class="fab" id="fab">
        <i class="fas fa-plus"></i>
    </div>

    <script>
        // Mobile Menu Toggle
        const menuToggle = document.getElementById('menuToggle');
        const sidebar = document.getElementById('sidebar');
        
        if (menuToggle && sidebar) {
            menuToggle.addEventListener('click', () => {
                sidebar.classList.toggle('active');
            });
        }

        // Real-time ROI Updates
        setInterval(() => {
            const roiCells = document.querySelectorAll('tbody td:nth-child(5)');
            roiCells.forEach(cell => {
                if (cell.textContent !== '-') {
                    const current = parseFloat(cell.textContent);
                    const change = (Math.random() * 0.4 - 0.2);
                    const newValue = Math.max(5, Math.min(30, current + change)).toFixed(1);
                    cell.textContent = newValue + '%';
                    
                    // Visual feedback
                    if (change > 0) {
                        cell.style.color = '#2ecc71';
                        cell.innerHTML = `${newValue}% <i class="fas fa-arrow-up"></i>`;
                    } else {
                        cell.style.color = '#e74c3c';
                        cell.innerHTML = `${newValue}% <i class="fas fa-arrow-down"></i>`;
                    }
                    
                    setTimeout(() => {
                        cell.style.color = '';
                    }, 1000);
                }
            });
        }, 3000);

        // Animate cards on load
        document.addEventListener('DOMContentLoaded', () => {
            const cards = document.querySelectorAll('.stat-card');
            cards.forEach((card, index) => {
                setTimeout(() => {
                    card.style.animation = `fadeIn 0.6s ease-out ${index * 0.1}s forwards`;
                }, 0);
            });

            // Add hover effect to table rows
            const tableRows = document.querySelectorAll('tbody tr');
            tableRows.forEach(row => {
                row.addEventListener('mouseenter', () => {
                    row.style.transform = 'translateX(5px)';
                });
                row.addEventListener('mouseleave', () => {
                    row.style.transform = 'translateX(0)';
                });
            });
        });

        // Floating Action Button click handler
        const fab = document.getElementById('fab');
        if (fab) {
            fab.addEventListener('click', () => {
                alert('Add new investment feature will open here!');
                fab.style.transform = 'scale(1.2)';
                setTimeout(() => {
                    fab.style.transform = 'scale(1)';
                }, 300);
            });
        }

        // Search functionality
        const searchBar = document.querySelector('.search-bar');
        if (searchBar) {
            searchBar.addEventListener('input', (e) => {
                const searchTerm = e.target.value.toLowerCase();
                const rows = document.querySelectorAll('tbody tr');
                
                rows.forEach(row => {
                    const projectName = row.querySelector('.project-info div:first-child').textContent.toLowerCase();
                    if (projectName.includes(searchTerm)) {
                        row.style.display = '';
                    } else {
                        row.style.display = 'none';
                    }
                });
            });
        }

        // Add ripple effect to buttons
        document.addEventListener('click', function(e) {
            if (e.target.classList.contains('btn') || e.target.closest('.btn')) {
                const button = e.target.classList.contains('btn') ? e.target : e.target.closest('.btn');
                const ripple = document.createElement('span');
                ripple.classList.add('ripple-effect');
                
                const rect = button.getBoundingClientRect();
                const x = e.clientX - rect.left;
                const y = e.clientY - rect.top;
                
                ripple.style.left = `${x}px`;
                ripple.style.top = `${y}px`;
                button.appendChild(ripple);
                
                setTimeout(() => {
                    ripple.remove();
                }, 600);
            }
        });

        // Fetch username and investment data
        $(document).ready(function() {
            // Step 1: Fetch username from users API
            $.ajax({
                url: '/api/user/getCurrentUser',
                method: 'GET',
                success: function(user) {
                    if (user && user.username) {
                        var username = user.username;
                        // Step 2: Fetch investment data with username
                        $.get('/api/dashboard/investments?username=' + encodeURIComponent(username), function(data) {
                            $("#yourInvestment").text("$" + Math.round(data.yourInvestment).toLocaleString("en-US"));
                            $("#totalInvestment").text("$" + Math.round(data.totalInvestment).toLocaleString("en-US"));
                        }).fail(function(jqXHR, textStatus, errorThrown) {
                            console.error("Failed to fetch investment data for username: " + username, textStatus, errorThrown);
                            $("#yourInvestment").text("$0");
                            $("#totalInvestment").text("$0");
                        });
                    } else {
                        console.error("No username found in user profile");
                        $("#yourInvestment").text("$0");
                        $("#totalInvestment").text("$0");
                    }
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.error("Failed to fetch user profile", textStatus, errorThrown);
                    $("#yourInvestment").text("$0");
                    $("#totalInvestment").text("$0");
                }
            });
        });
    </script>
</body>
</html>