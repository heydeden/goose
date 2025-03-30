document.addEventListener('DOMContentLoaded', function() {
    // Scroll functionality for game cards
    const scrollContainer = document.getElementById('gameScroll');
    const scrollLeftBtn = document.getElementById('scrollLeft');
    const scrollRightBtn = document.getElementById('scrollRight');
    const gameCards = document.querySelectorAll('.game-card');
    
    // Calculate card width including margin
    const cardStyle = window.getComputedStyle(gameCards[0]);
    const cardWidth = gameCards[0].offsetWidth + 
                     parseInt(cardStyle.marginRight) + 
                     parseInt(cardStyle.marginLeft);
    
    // Update button states based on scroll position
    function updateButtonStates() {
        scrollLeftBtn.disabled = scrollContainer.scrollLeft <= 10;
        scrollRightBtn.disabled = scrollContainer.scrollLeft >= 
            (scrollContainer.scrollWidth - scrollContainer.clientWidth - 10);
    }
    
    // Scroll functions
    function scrollLeft() {
        scrollContainer.scrollBy({
            left: -cardWidth,
            behavior: 'smooth'
        });
    }
    
    function scrollRight() {
        scrollContainer.scrollBy({
            left: cardWidth,
            behavior: 'smooth'
        });
    }
    
    // Event listeners for buttons
    scrollLeftBtn.addEventListener('click', scrollLeft);
    scrollRightBtn.addEventListener('click', scrollRight);
    
    // Keyboard navigation
    document.addEventListener('keydown', function(e) {
        if (e.key === 'ArrowLeft') {
            scrollLeft();
        } else if (e.key === 'ArrowRight') {
            scrollRight();
        }
    });
    
    // Update buttons on scroll
    scrollContainer.addEventListener('scroll', updateButtonStates);
    
    // Initial check
    updateButtonStates();
    
    // Touch/swipe support for mobile
    let touchStartX = 0;
    let touchEndX = 0;
    const swipeThreshold = 50;
    
    scrollContainer.addEventListener('touchstart', (e) => {
        touchStartX = e.touches[0].clientX;
    }, {passive: true});
    
    scrollContainer.addEventListener('touchend', (e) => {
        touchEndX = e.changedTouches[0].clientX;
        handleSwipe();
    }, {passive: true});
    
    function handleSwipe() {
        const difference = touchStartX - touchEndX;
        if (difference > swipeThreshold) {
            scrollRight();
        } else if (difference < -swipeThreshold) {
            scrollLeft();
        }
    }
});