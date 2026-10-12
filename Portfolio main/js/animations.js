// js/animations.js

document.addEventListener('DOMContentLoaded', () => {
  // Set up the Intersection Observer
  const observerOptions = {
    threshold: 0.1, // Triggers when 10% of the element is visible
    rootMargin: "0px 0px -50px 0px" // Triggers slightly before it hits the bottom of the screen
  };

  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      // If the element scrolls into view
      if (entry.isIntersecting) {
        entry.target.classList.add('aos-animate');
        
        // Optional: Stop observing once it animates in, so it doesn't repeat every time you scroll up and down
        observer.unobserve(entry.target);
      }
    });
  }, observerOptions);

  // Find all elements with the 'data-aos' attribute and observe them
  const animatedElements = document.querySelectorAll('[data-aos]');
  animatedElements.forEach(el => observer.observe(el));
});