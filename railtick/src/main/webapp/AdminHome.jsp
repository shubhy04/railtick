<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Railtick Admin</title>
    <!-- Link to Bootstrap CSS and Font Awesome for icons -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700&display=swap">
    <link rel="stylesheet" href="Admin.css">
</head>
<%@include file="global/AdminNavbar.jsp"%>
<body class="bg-light">
    <header class="bg-dark text-white text-center py-2">
        <div class="container">
            <h1 class="display-4">Railtick Admin</h1>
            <p class="lead">Manage trains with ease</p>
        </div>
    </header>

    <div class="container mt-4">
        <div class="row">
            <div class="col-md-4 mb-3">
                <div class="card bg-success text-white rounded shadow">
                    <div class="card-body text-center">
                        <i class="fas fa-eye fa-3x mb-2"></i>
                        <h5 class="card-title">View Trains</h5>
                        <p class="card-text">Browse through the list of all trains.</p>
                        <a href="adminviewtrainfwd" class="btn btn-outline-light btn-sm">View Trains</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4 mb-3">
                <div class="card bg-info text-white rounded shadow">
                    <div class="card-body text-center">
                        <i class="fas fa-search fa-3x mb-2"></i>
                        <h5 class="card-title">Search By Train No</h5>
                        <p class="card-text">Find specific trains using their Train No.</p>
                        <a href="adminsearchtrainfwd" class="btn btn-outline-light btn-sm">Search Trains</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4 mb-3">
                <div class="card bg-warning text-dark rounded shadow">
                    <div class="card-body text-center">
                        <i class="fas fa-plus fa-3x mb-2"></i>
                        <h5 class="card-title">Add Train</h5>
                        <p class="card-text">Add a new train to the system.</p>
                        <a href="addtrainfwd" class="btn btn-outline-dark btn-sm">Add Train</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4 mb-3">
                <div class="card bg-secondary text-white rounded shadow">
                    <div class="card-body text-center">
                        <i class="fas fa-edit fa-3x mb-2"></i>
                        <h5 class="card-title">Update Train Details</h5>
                        <p class="card-text">Edit and update information for existing trains.</p>
                        <a href="Adupdatetrain.jsp" class="btn btn-outline-light btn-sm">Update Train Details</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-3">
                <div class="card bg-danger text-white rounded shadow">
                    <div class="card-body text-center">
                        <i class="fas fa-right-from-bracket fa-3x mb-2"></i>
                        <h5 class="card-title">Logout</h5>
                        <p class="card-text">logout your account.</p>
                        <a href="adminLogout" class="btn btn-outline-light btn-sm">Logout</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Link to Bootstrap JS, Popper.js, and Font Awesome icons -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.8/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
