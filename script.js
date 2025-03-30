document.addEventListener('DOMContentLoaded', function() {
    const scrollContainer = document.getElementById('gameScroll');
    const scrollLeftBtn = document.getElementById('scrollLeft');
    const scrollRightBtn = document.getElementById('scrollRight');
    const gameCards = Array.from(document.querySelectorAll('.game-card'));
    
    // Calculate container center position
    const container = scrollContainer;
    const containerWidth = container.offsetWidth;
    const containerCenter = containerWidth / 2;
    
    // Function to center the card
    function centerCard(card) {
        const cardRect = card.getBoundingClientRect();
        const containerRect = container.getBoundingClientRect();
        
        // Calculate scroll position to center the card
        const scrollPosition = card.offsetLeft - (containerWidth - cardRect.width) / 2;
        
        container.scrollTo({
            left: scrollPosition,
            behavior: 'smooth'
        });
    }
    
    // Find the currently centered card
    function findCenteredCard() {
        const containerRect = container.getBoundingClientRect();
        const containerCenterX = containerRect.left + containerRect.width / 2;
        
        for (const card of gameCards) {
            const cardRect = card.getBoundingClientRect();
            const cardCenterX = cardRect.left + cardRect.width / 2;
            
            if (Math.abs(cardCenterX - containerCenterX) < 30) {
                return card;
            }
        }
        return null;
    }
    
    // Scroll to previous card
    function scrollToPrevious() {
        const currentCard = findCenteredCard();
        if (!currentCard) return;
        
        const currentIndex = gameCards.indexOf(currentCard);
        if (currentIndex > 0) {
            centerCard(gameCards[currentIndex - 1]);
        }
    }
    
    // Scroll to next card
    function scrollToNext() {
        const currentCard = findCenteredCard();
        if (!currentCard) return;
        
        const currentIndex = gameCards.indexOf(currentCard);
        if (currentIndex < gameCards.length - 1) {
            centerCard(gameCards[currentIndex + 1]);
        }
    }
    
    // Update button states
    function updateButtonStates() {
        const currentCard = findCenteredCard();
        if (!currentCard) return;
        
        const currentIndex = gameCards.indexOf(currentCard);
        scrollLeftBtn.disabled = currentIndex === 0;
        scrollRightBtn.disabled = currentIndex === gameCards.length - 1;
    }
    
    // Event listeners for buttons
    scrollLeftBtn.addEventListener('click', scrollToPrevious);
    scrollRightBtn.addEventListener('click', scrollToNext);
    
    // Keyboard navigation
    document.addEventListener('keydown', function(e) {
        if (e.key === 'ArrowLeft') {
            scrollToPrevious();
        } else if (e.key === 'ArrowRight') {
            scrollToNext();
        }
    });
    
    // Update buttons on scroll
    container.addEventListener('scroll', updateButtonStates);
    
    // Touch/swipe support
    let touchStartX = 0;
    let touchEndX = 0;
    const swipeThreshold = 50;
    
    container.addEventListener('touchstart', function(e) {
        touchStartX = e.touches[0].clientX;
    }, { passive: true });
    
    container.addEventListener('touchend', function(e) {
        touchEndX = e.changedTouches[0].clientX;
        handleSwipe();
    }, { passive: true });
    
    function handleSwipe() {
        const difference = touchStartX - touchEndX;
        if (difference > swipeThreshold) {
            scrollToNext();
        } else if (difference < -swipeThreshold) {
            scrollToPrevious();
        }
    }
    
    // Initialize
    updateButtonStates();
    
    // Center first card on load
    if (gameCards.length > 0) {
        setTimeout(() => {
            centerCard(gameCards[0]);
        }, 100);
    }
});