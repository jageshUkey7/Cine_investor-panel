<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cinevestor | FAQ</title>
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

        /* FAQ Page Styles */
        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
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

        .search-container {
            position: relative;
            width: 300px;
        }

        .search-input {
            width: 100%;
            padding: 0.8rem 1rem 0.8rem 2.5rem;
            border-radius: 30px;
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            color: var(--primary-light);
            font-size: 0.9rem;
        }

        .search-input:focus {
            outline: none;
            border-color: var(--studio-blue);
        }

        .search-icon {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: var(--studio-blue);
        }

        /* FAQ Categories */
        .categories {
            display: flex;
            gap: 1rem;
            margin-bottom: 2rem;
            flex-wrap: wrap;
        }

        .category-btn {
            padding: 0.7rem 1.5rem;
            border-radius: 30px;
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            color: var(--primary-light);
            cursor: pointer;
            transition: all 0.3s ease;
            font-size: 0.9rem;
        }

        .category-btn:hover {
            background: rgba(255, 137, 6, 0.1);
            border-color: var(--filmmaker-orange);
        }

        .category-btn.active {
            background: var(--gradient);
            color: white;
            border-color: transparent;
        }

        /* FAQ Accordion */
        .faq-container {
            max-width: 900px;
            margin: 0 auto;
        }

        .faq-item {
            background: rgba(31, 27, 58, 0.7);
            border-radius: 12px;
            margin-bottom: 1rem;
            border: 1px solid rgba(255, 255, 255, 0.1);
            overflow: hidden;
            transition: all 0.3s ease;
        }

        .faq-item:hover {
            border-color: var(--filmmaker-orange);
        }

        .faq-question {
            padding: 1.5rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            cursor: pointer;
            font-weight: 500;
            font-size: 1.1rem;
        }

        .faq-question i {
            transition: transform 0.3s ease;
            color: var(--studio-blue);
        }

        .faq-answer {
            padding: 0 1.5rem;
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.3s ease, padding 0.3s ease;
            border-top: 1px solid transparent;
        }

        .faq-item.active .faq-answer {
            padding: 0 1.5rem 1.5rem;
            max-height: 500px;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
        }

        .faq-item.active .faq-question i {
            transform: rotate(180deg);
        }

        /* Contact Section */
        .contact-section {
            margin-top: 3rem;
            padding: 2rem;
            background: rgba(31, 27, 58, 0.7);
            border-radius: 16px;
            text-align: center;
            border: 1px solid rgba(255, 137, 6, 0.3);
        }

        .contact-title {
            font-size: 1.5rem;
            margin-bottom: 1rem;
            color: var(--filmmaker-orange);
        }

        .contact-text {
            margin-bottom: 1.5rem;
            opacity: 0.9;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }

        .contact-btn {
            padding: 0.9rem 1.8rem;
            border-radius: 30px;
            background: var(--gradient);
            color: white;
            border: none;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }

        .contact-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(229, 49, 112, 0.3);
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
            
            .page-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 1rem;
            }
            
            .search-container {
                width: 100%;
            }
        }

        @media (max-width: 576px) {
            .categories {
                gap: 0.5rem;
            }
            
            .category-btn {
                padding: 0.6rem 1rem;
                font-size: 0.8rem;
            }
            
            .faq-question {
                padding: 1rem;
                font-size: 1rem;
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
                    <i class="fas fa-question-circle"></i>
                    Frequently Asked Questions
                </h1>
                <div class="search-container">
                    <i class="fas fa-search search-icon"></i>
                    <input type="text" class="search-input" placeholder="Search FAQs...">
                </div>
            </div>

            <div class="categories">
                <button class="category-btn active">All</button>
                <button class="category-btn">Investing</button>
                <button class="category-btn">Projects</button>
                <button class="category-btn">Payments</button>
                <button class="category-btn">Legal</button>
                <button class="category-btn">Account</button>
            </div>

            <div class="faq-container">
                <!-- FAQ Item 1 -->
                <div class="faq-item">
                    <div class="faq-question">
                        <span>How do I invest in a film project?</span>
                        <i class="fas fa-chevron-down"></i>
                    </div>
                    <div class="faq-answer">
                        <p>To invest in a film project on Cinevestor, simply browse our available projects, select one that interests you, and click the "Invest Now" button. You'll need to complete our investor onboarding process, which includes verifying your identity and agreeing to the investment terms. Minimum investments vary by project.</p>
                    </div>
                </div>

                <!-- FAQ Item 2 -->
                <div class="faq-item">
                    <div class="faq-question">
                        <span>What is the typical return on investment?</span>
                        <i class="fas fa-chevron-down"></i>
                    </div>
                    <div class="faq-answer">
                        <p>ROI varies by project and depends on many factors including the project's budget, distribution deals, and overall success. Our historical average ROI ranges from 15-30%, but this is not guaranteed. Each project page shows projected ROI based on financial models.</p>
                    </div>
                </div>

                <!-- FAQ Item 3 -->
                <div class="faq-item">
                    <div class="faq-question">
                        <span>How are profits distributed?</span>
                        <i class="fas fa-chevron-down"></i>
                    </div>
                    <div class="faq-answer">
                        <p>Profits are distributed quarterly after the project's release. Payments are made directly to your registered bank account once the project has recouped its production costs. You'll receive detailed financial reports showing revenue streams from theatrical, streaming, TV, and other distribution channels.</p>
                    </div>
                </div>

                <!-- FAQ Item 4 -->
                <div class="faq-item">
                    <div class="faq-question">
                        <span>What happens if a project doesn't get funded?</span>
                        <i class="fas fa-chevron-down"></i>
                    </div>
                    <div class="faq-answer">
                        <p>If a project doesn't reach its funding goal by the deadline, all committed funds are returned to investors in full. You won't be charged anything, and we'll notify you immediately if a project you're interested in doesn't get funded.</p>
                    </div>
                </div>

                <!-- FAQ Item 5 -->
                <div class="faq-item">
                    <div class="faq-question">
                        <span>Can I sell my investment to someone else?</span>
                        <i class="fas fa-chevron-down"></i>
                    </div>
                    <div class="faq-answer">
                        <p>Currently, investments in film projects are illiquid and cannot be sold on a secondary market. However, we're developing a marketplace for future trading of film investments. You'll maintain your investment position until the project completes its revenue cycle.</p>
                    </div>
                </div>

                <!-- FAQ Item 6 -->
                <div class="faq-item">
                    <div class="faq-question">
                        <span>What investor protections are in place?</span>
                        <i class="fas fa-chevron-down"></i>
                    </div>
                    <div class="faq-answer">
                        <p>All projects undergo rigorous vetting, and we require production companies to provide completion bonds for larger projects. Investor funds are held in escrow until funding targets are met, and we conduct regular financial audits. However, as with any investment, there is risk involved.</p>
                    </div>
                </div>
            </div>

            <div class="contact-section">
                <h3 class="contact-title">Still have questions?</h3>
                <p class="contact-text">Our support team is available to help with any additional questions you might have about investing through Cinevestor.</p>
                <button class="contact-btn">
                    <i class="fas fa-envelope"></i> Contact Support
                </button>
            </div>
        </main>
    </div>

    <script>
        // FAQ Accordion Functionality
        const faqItems = document.querySelectorAll('.faq-item');
        faqItems.forEach(item => {
            const question = item.querySelector('.faq-question');
            question.addEventListener('click', () => {
                // Close all other items
                faqItems.forEach(otherItem => {
                    if (otherItem !== item) {
                        otherItem.classList.remove('active');
                    }
                });
                
                // Toggle current item
                item.classList.toggle('active');
            });
        });

        // Category Filter Functionality
        const categoryBtns = document.querySelectorAll('.category-btn');
        categoryBtns.forEach(btn => {
            btn.addEventListener('click', () => {
                categoryBtns.forEach(b => b.classList.remove('active'));
                btn.classList.add('active');
                
                // In a real implementation, this would filter the FAQs
                // For demo, we'll just animate the items
                faqItems.forEach((item, index) => {
                    setTimeout(() => {
                        item.style.opacity = 0;
                        setTimeout(() => {
                            item.style.opacity = 1;
                        }, 300);
                    }, index * 50);
                });
            });
        });

        // Search Functionality
        const searchInput = document.querySelector('.search-input');
        searchInput.addEventListener('input', (e) => {
            const searchTerm = e.target.value.toLowerCase();
            
            faqItems.forEach(item => {
                const question = item.querySelector('.faq-question span').textContent.toLowerCase();
                const answer = item.querySelector('.faq-answer p').textContent.toLowerCase();
                
                if (question.includes(searchTerm) || answer.includes(searchTerm)) {
                    item.style.display = 'block';
                } else {
                    item.style.display = 'none';
                }
            });
        });
    </script>
</body>
</html>