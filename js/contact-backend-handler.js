// js/contact-backend-handler.js

document.addEventListener('DOMContentLoaded', () => {
  const contactForm = document.getElementById('contactForm');
  const submitBtn = document.getElementById('submitBtn');
  const btnText = document.getElementById('btnText');
  const btnLoader = document.getElementById('btnLoader');
  const formSuccess = document.getElementById('formSuccess');

  if (contactForm) {
    contactForm.addEventListener('submit', async (e) => {
      e.preventDefault(); // Prevent standard page reload

      // UI updates for loading state
      btnText.style.display = 'none';
      btnLoader.style.display = 'inline-block';
      submitBtn.disabled = true;

      // Gather form data
      const formData = {
        name: document.getElementById('name').value,
        email: document.getElementById('email').value,
        subject: document.getElementById('subject').value,
        message: document.getElementById('message').value
      };

      try {
        // Send data to your Node.js backend
        // Note: Change localhost:3000 to your deployed backend URL when going live
        const response = await fetch('http://localhost:3000/api/contact', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify(formData)
        });

        if (response.ok) {
          // Success UI state
          formSuccess.style.display = 'block';
          formSuccess.style.color = '#28C940';
          formSuccess.innerHTML = '✅ Message sent! I\'ll get back to you soon.';
          contactForm.reset();
        } else {
          throw new Error('Failed to send');
        }
      } catch (error) {
        // Error UI state
        formSuccess.style.display = 'block';
        formSuccess.style.color = '#FF5F57';
        formSuccess.style.backgroundColor = 'rgba(255, 95, 87, 0.08)';
        formSuccess.innerHTML = '❌ Oops! Something went wrong. Please try again or email me directly.';
      } finally {
        // Restore button state
        btnText.style.display = 'inline-block';
        btnLoader.style.display = 'none';
        submitBtn.disabled = false;
        
        // Hide success/error message after 5 seconds
        setTimeout(() => {
            formSuccess.style.display = 'none';
        }, 5000);
      }
    });
  }
});