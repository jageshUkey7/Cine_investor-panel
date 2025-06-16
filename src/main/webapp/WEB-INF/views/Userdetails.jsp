<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" contentType="width=device-width, initial-scale=1.0">
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

        /* Animations */
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
            animation: gradientBG 6s ease infinite;
            background-size: 400% 400%;
        }

        .main-content {
            flex: 1;
            padding: 2rem;
            margin-left: 18rem;
            max-width: 100%;
        }

        /* Projects Page */
        .page-header {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            width: 100%;
            align-items: center;
            margin-bottom: 2rem;
            animation: fadeIn 0.6s ease-out;
        }

        .page-title {
            font-size: 1.7rem;
            background: var(--gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
             margin-right: 30rem;
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

        .input-group {
            margin-right: 10rem;
            width: 20%;
            margin-bottom: 1.5rem;
            position: relative;
        }

        .input-group input {
            width: 20%;
            padding: 1rem 1.5rem;
            border: 2px solid rgba(255,255,255,0.1);
            border-radius: 8px;
            background: rgba(255,255,255,0.05);
            color: var(--primary-light);
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        .input-group input:focus {
            outline: none;
            border-color: var(--filmmaker-orange);
            background: rgba(255,255,255,0.1);
            box-shadow: 0 0 0 4px rgba(255,137,6,0.1);
        }

        .search-btn {
            background: var(--gradient) !important;
            border: none !important;
            color: white !important;
            position: relative;
            overflow: hidden;
            transition: all 0.3s ease;
            padding: 0.8rem 1.5rem;
            border-radius: 8px;
            margin-left: -50px;
            cursor: pointer;
        }

        .search-btn:hover {
            background: linear-gradient(135deg, var(--investor-pink), var(--filmmaker-orange)) !important;
        }

        .search-input {
            color: var(--primary-light) !important;
            padding-right: 50px; /* Space for the button */
        }

        .search-input::placeholder {
            color: var(--primary-light) !important;
            opacity: 0.8 !important;
        }

        .table-container {
            background-color: transparent;
            padding: 0;
            border-radius: 0;
            box-shadow: none;
            width: 117%;
            overflow-x: auto;
            margin-left: 1.3rem;
            overflow: hidden;
        }

        table {
            width: 10rem;
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

        .status-pending {
            background: rgba(241, 196, 15, 0.1);
            color: #f1c40f;
            border: 1px solid #f1c40f;
        }

        .status-approved {
            background: rgba(46, 204, 113, 0.1);
            color: var(--success-green);
            border: 1px solid var(--success-green);
        }

        /* Modal Styles */
        .modal {
    position: fixed;
    margin-top: 15rem; /* Replaces width: 100%; height: 100%; for clarity */
    margin-left: 60rem;
    background-color:none; /* Semi-transparent overlay */
    display: flex;
    justify-content: center; /* Centers horizontally */
    align-items: center; /* Centers vertically */
    z-index: 1000; /* Ensures it’s above other content */
}

/* Modal content box */
.modal-content {
    width: 80%; /* Takes 80% of screen width, adjustable */
    max-width: 600px; /* Optional: caps the width for larger screens */
    background-color: rgba(15, 14, 23, 0.85);/* Your dark background */
    padding: 20px;
    border-radius: 10px;
    text-align: center; /* Centers all text inside, including <h2> and <p> */
    max-height: 80vh; /* Limits height with scroll if needed */
    overflow-y: auto; /* Adds scrollbar if content overflows */
    border: 2px solid #ff8906; /* Your orange border */
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3); /* Shadow for depth */
}
    .close {
        float: right;
        font-size: 28px;
        cursor: pointer;
        color: var(--filmmaker-orange);
    }

    .close:hover {
        color: var(--investor-pink);
    }

    .modal-content h2 {
        background: var(--gradient);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        margin-bottom: 1rem;
        text-align: center;
    }

    .modal-content p {
        
        margin: 0.5rem 0;
        color: black;
    }

    .modal-content label {
        display: block;
        margin: 10px 0 5px;
        color: var(--primary-light);
    }

    .modal-content input {
        width: 100%;
        padding: 8px;
        margin-bottom: 10px;
        border: 1px solid rgba(255, 137, 6, 0.3);
        border-radius: 4px;
        background: rgba(255, 255, 255, 0.05);
        color: var(--primary-light);
    }

    .modal-content button {
        padding: 10px 20px;
        background: var(--gradient);
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: all 0.3s ease;
        width: 100%;
    }

    .modal-content button:hover {
        background: linear-gradient(135deg, var(--investor-pink), var(--filmmaker-orange));
    }

        /* General Button Styling */
.view-btn, .update-btn {
    background: none;
    border: none;
 
    padding: 8px;
    cursor: pointer;
    transition: all 0.3s ease;
    margin-right: 5px; /* Space between buttons */
}

/* Icon Styling */
.view-btn i, .update-btn i {
    color: var(--filmmaker-orange);
    font-size: 1.2rem; /* Adjust icon size */
}

/* Hover Effects */
.view-btn:hover {
    background: rgba(255, 137, 6, 0.1); /* Light orange background on hover */
    border-color: var(--investor-pink);
}

.update-btn:hover {
    background: rgba(229, 49, 112, 0.1); /* Light pink background on hover */
    border-color: var(--investor-pink);
}

.view-btn:hover i {
    color: var(--investor-pink); /* Change icon color on hover */
}

.update-btn:hover i {
    color: var(--investor-pink); /* Change icon color on hover */
}

/* Active State (optional) */
.view-btn:active, .update-btn:active {
    transform: scale(0.95); /* Slight shrink on click */
}
    </style>
</head>
<body>
    <div class="app-container">
        <%@ include file="header.jsp"%>
        <!-- Main Content -->
        <main class="main-content">
            <div class="page-header">
                <h1 class="page-title">
                    <i class="fas fa-project-diagram"></i>
                    User Details
                </h1>
                <div class="input-group">
                    <input 
                        type="search" 
                        class="form-control search-input" 
                        placeholder="Search investments..." 
                        aria-label="Search investments"
                    >
                    <button class="btn search-btn" type="submit">
                        <i class="fas fa-search text-white"></i>
                    </button>
                </div>
            </div>
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>refId</th>
                            <th>CustomerFirstname</th>
                            <th>CustomerLastname</th>
                            <th>Email</th>
                            <th>Username</th>
                            <th>Createdon</th>
                            <th>Createdby</th>
                            <th>progressId</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Data will be populated dynamically -->
                    </tbody>
                </table>
            </div>
            <!-- View Details Modal -->
            <div id="viewModal" class="modal" style="display:none;">
                <div class="modal-content">
                    <span class="close">×</span>
                    <h2>User Details</h2>
                    <p><strong>Ref ID:</strong> <span id="viewRefId"></span></p>
                    <p><strong>First Name:</strong> <span id="viewFirstname"></span></p>
                    <p><strong>Last Name:</strong> <span id="viewLastname"></span></p>
                    <p><strong>Email:</strong> <span id="viewEmail"></span></p>
                    <p><strong>Username:</strong> <span id="viewUsername"></span></p>
                    <p><strong>Created On:</strong> <span id="viewCreatedOn"></span></p>
                    <p><strong>Created By:</strong> <span id="viewCreatedBy"></span></p>
                    <p><strong>Progress ID:</strong> <span id="viewProgressId"></span></p>
                </div>
            </div>
            <!-- Update Details Modal -->
            <div id="updateModal" class="modal" style="display:none;">
                <div class="modal-content">
                    <span class="close">×</span>
                    <h2>Update User Details</h2>
                    <form id="updateForm">
                        <input type="hidden" id="updateRefId" name="refId">
                        <label style="color: black;" for="newFirstname">FirstName:</label>
                        <input style="color: black;"  type="text" id="newFirstname" name="newFirstname" required>
                        <label style="color: black;" for="newLastname">LastName:</label>
                        <input style="color: black;"  type="text" id="newLastname" name="newLastname" required>
                        <label style="color: black;" for="newEmail">New Email:</label>
                        <input style="color: black;"  type="email" id="newEmail" name="newEmail" required>
                        <label style="color: black;" for="newPassword">New Password:</label>
                        <input style="color: black;"   type="password" id="newPassword" name="newPassword" required>
                        <button type="submit">Update</button>
                    </form>
                </div>
            </div>
        </main>
    </div>

    <script>
  $(document).ready(function() {
        var loggedInUsername = '<%= session.getAttribute("username") != null ? session.getAttribute("username") : "" %>';
        if (!loggedInUsername) {
            $('table tbody').html('<tr><td colspan="9">Please log in to view your details</td></tr>');
            return;
        }

        loadUserData(loggedInUsername);

        function loadUserData(username, searchTerm = '') {
            $.ajax({
                url: '/api/user/getCurrentUser',
                type: 'GET',
                data: { username: username },
                dataType: 'json',
                success: function(user) {
                    var tbody = $('table tbody');
                    tbody.empty();

                    if (!user) {
                        tbody.append('<tr><td colspan="9">User not found</td></tr>');
                        return;
                    }

                    var statusClass = user.progressId === 0 ? 'status-pending' : 'status-approved';
                    var statusText = user.progressId === 0 ? 'Pending' : 'Approved';

                    var row = '<tr>' +
                        '<td><div>' + user.refId + '</div></td>' +
                        '<td>' +
                            '<div class="project-info">' +
                                '<div class="project-image">' +
                                    '<i class="fas fa-user"></i>' +
                                '</div>' +
                                '<div>' + user.firstname + '</div>' +
                            '</div>' +
                        '</td>' +
                        '<td><div>' + user.lastname + '</div></td>' +
                        '<td>' + user.email + '</td>' +
                        '<td><div>' + user.username + '</div></td>' +
                        '<td>' + user.createdOn + '</td>' +
                        '<td>' + user.createdBy + '</td>' +
                        '<td><span class="status-badge ' + statusClass + '">' + statusText + '</span></td>' +
                        '<td>' +
                            '<button class="view-btn" data-refid="' + user.refId + '"><i class="fas fa-eye"></i></button>' +
                            '<button class="update-btn" data-refid="' + user.refId + '"><i class="fas fa-edit"></i></button>' +
                        '</td>' +
                    '</tr>';
                    tbody.append(row);

                    $('.view-btn').on('click', function() {
                        var refId = $(this).data('refid');
                        openViewModal(refId);
                    });

                    $('.update-btn').on('click', function() {
                        var refId = $(this).data('refid');
                        openUpdateModal(refId);
                    });
                },
                error: function(xhr, status, error) {
                    console.error('Error fetching user data:', error);
                    $('table tbody').html('<tr><td colspan="9">Error loading data</td></tr>');
                }
            });
        }

        function openViewModal(refId) {
            $.ajax({
                url: '/api/user/getCurrentUser',
                type: 'GET',
                data: { username: loggedInUsername },
                dataType: 'json',
                success: function(user) {
                    if (user && user.refId == refId) {
                        $('#viewRefId').text(user.refId);
                        $('#viewFirstname').text(user.firstname);
                        $('#viewLastname').text(user.lastname);
                        $('#viewEmail').text(user.email);
                        $('#viewUsername').text(user.username);
                        $('#viewCreatedOn').text(user.createdOn);
                        $('#viewCreatedBy').text(user.createdBy);
                        $('#viewProgressId').text(user.progressId);
                        $('#viewModal').show();
                    } else {
                        alert('User details not found');
                    }
                },
                error: function() {
                    alert('Error fetching user details');
                }
            });
        }

        function openUpdateModal(refId) {
            $.ajax({
                url: '/api/user/getCurrentUser',
                type: 'GET',
                data: { username: loggedInUsername },
                dataType: 'json',
                success: function(user) {
                    if (user && user.refId == refId) {
                        $('#updateRefId').val(user.refId);
                        $('#newFirstname').val(user.firstname);
                        $('#newLastname').val(user.lastname);
                        $('#newEmail').val(user.email);
                        $('#newPassword').val('');
                        $('#updateModal').show();
                    } else {
                        alert('User details not found');
                    }
                },
                error: function() {
                    alert('Error fetching user details');
                }
            });
        }

        $('#updateForm').on('submit', function(e) {
            e.preventDefault();
            console.log('Form submitted');
            var updates = {
                username: loggedInUsername, // Include username to identify the user
                firstname: $('#newFirstname').val(),
                lastname: $('#newLastname').val(),
                email: $('#newEmail').val(),
                password: $('#newPassword').val()
            };
            console.log('Sending updates:', updates);

            $.ajax({
                url: '/api/user/update',
                type: 'PATCH',
                contentType: 'application/json',
                data: JSON.stringify(updates),
                success: function(response) {
                    console.log('Update response:', response);
                    alert('Update successful');
                    loadUserData(loggedInUsername);
                    $('#updateModal').hide();
                },
                error: function(xhr, status, error) {
                    console.error('Update error:', xhr.status, xhr.responseText, status, error);
                    alert('Error updating user: ' + (xhr.responseText || 'Unknown error'));
                }
            });
        });

        $('.close').on('click', function() {
            $(this).closest('.modal').hide();
        });
    });
    </script>
</body>
</html> 