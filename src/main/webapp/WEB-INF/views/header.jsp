<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>cinevestor Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
     crossorigin="anonymous"></script>
    
    <style>
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

        /* ==== Film Strip Sidebar ==== */
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
    overflow-x: hidden;
    /* Hide scrollbar for Chrome, Safari and Opera */
    scrollbar-width: none; /* For Firefox */
    -ms-overflow-style: none; /* For IE and Edge */
}

/* Hide scrollbar for Chrome, Safari and Opera */
.sidebar::-webkit-scrollbar {
    display: none;
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


        /* ==== Search Bar ==== */
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

        /* ==== Navigation Menu ==== */
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


        /* Responsive */
        @media (max-width: 768px) {
            .sidebar {
                width: 100px;
            }

            .sidebar ul li a span {
                display: none;
            }

            .main-content {
                margin-left: 100px;
                width: calc(100% - 100px);
            }
        }
    </style>
</head>
<body>

   <!-- Mobile Menu Toggle Button -->
   <div class="menu-toggle" id="menuToggle">
    <i class="fas fa-bars"></i>
</div>

<!-- Film Strip Sidebar -->
<aside class="sidebar" id="sidebar">
    <div class="logo-container">
        <div class="logo-icon">
            <i class="fas fa-film"></i>
        </div>
        <div class="logo-text">CINEVESTOR</div>
    </div>

    <!-- Search Bar -->
    <div class="search-container">
        <i class="fas fa-search search-icon"></i>
        <input type="text" class="search-bar" placeholder="Search investments...">
    </div>

    <!-- User Profile -->
    <div class="user-profile">
        <div class="user-avatar"></div>
        <h3 class="user-name"></h3>
        <div class="user-role">Premium Investor</div>
    </div>

    <!-- Navigation Menu -->
    <ul class="nav-menu">
        <li class="nav-item">
            <a href="dashboard" class="nav-link active">
                <i class="fas fa-chart-pie"></i>
                Dashboard
            </a>
        </li>

        <li class="nav-item">
            <a href="Userdetails" class="nav-link">
                <i class="fas fa-id-card-alt"></i>
                User Details
            </a>
        </li>

        <li class="nav-item">
            <a href="KYC" class="nav-link">
                <i class="fas fa-user-check"></i>
                KYC Verification
                <span class="notification-badge">3</span>
            </a>
        </li>
        <li class="nav-item">
            <a href="Projects" class="nav-link">
                <i class="fas fa-project-diagram"></i>
                My Projects
            </a>
        </li>
        <li class="nav-item">
            <a href="#" class="nav-link">
                <i class="fas fa-search-dollar"></i>
                Discover
                <span class="notification-badge">12</span>
            </a>
        </li>
        <li class="nav-item">
            <a href="#" class="nav-link">
                <i class="fas fa-chart-line"></i>
                Performance
            </a>
        </li>
        <li class="nav-item">
            <a href="contracts" class="nav-link">
                <i class="fas fa-file-contract"></i>
                Contracts
            </a>
        </li>
        <li class="nav-item">
            <a href="FAQ" class="nav-link">
                <i class="fas fa-question-circle"></i>
                FAQ
            </a>
        </li>
        <li class="nav-item">
            <a href="settings" class="nav-link">
                <i class="fas fa-cog"></i>
                Settings
            </a>
        </li>
        <li class="nav-item">
            <a href="logout" class="nav-link">
                <i class="fas fa-sign-out-alt"></i>
                Logout
            </a>
        </li>
    </ul>
</aside>
<script>
   
    $(document).ready(function() {
        var username = "${username}";
        if (username) {
            $.ajax({
                url: '/api/user/getCurrentUser',
                method: 'GET',
                data: { username: username },
                success: function(user) {
                    $(".user-name").text(user.username);
                    if (user.firstname && user.lastname) {
                        var initials = user.firstname.charAt(0) + user.lastname.charAt(0);
                        $(".user-avatar").text(initials.toUpperCase());
                    }
                },
                error: function() {
                    $(".user-name").text("Error fetching user");
                }
            });
        } else {
            $(".user-name").text("Not logged in");
        }
    });
 
 
</script>
</body>