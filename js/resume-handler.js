// js/resume-handler.js

document.addEventListener('DOMContentLoaded', () => {
  const downloadBtn = document.getElementById('triggerResumeDownload');

  if (downloadBtn) {
    downloadBtn.addEventListener('click', (e) => {
      e.preventDefault();
      
      // Visual feedback on click
      const originalText = downloadBtn.innerHTML;
      downloadBtn.innerHTML = 'Downloading...';
      
      // Create a temporary anchor element
      const link = document.createElement('a');
      link.href = 'assets/Avinash_kumar_Sharma_Resume.pdf'; // Path to your PDF
      link.download = 'Avinash_kumar_Sharma_Resume.pdf';    // The name the downloaded file will have
      
      // Append, click, and remove the link
      document.body.appendChild(link);
      link.click();
      document.body.removeChild(link);

      // Reset button text after a short delay
      setTimeout(() => {
        downloadBtn.innerHTML = '✅ Downloaded Successfully';
        setTimeout(() => {
          downloadBtn.innerHTML = originalText;
        }, 3000);
      }, 500);
    });
  }
});