// Ensure DOM is fully loaded before executing scripts
document.addEventListener('DOMContentLoaded', () => {
    
    // --- Login Logic ---
    const loginForm = document.getElementById('loginForm');
    if (loginForm) {
        loginForm.addEventListener('submit', async (e) => {
            e.preventDefault();
            const email = document.getElementById('userEmail').value;
            const password = document.getElementById('userPassword').value;

            // In a real application, this would be an async fetch() call to your Java backend
            console.log(`Authenticating user: ${email}...`);
            
            try {
                // Mocking a network request delay
                await new Promise(resolve => setTimeout(resolve, 800));
                // Redirect to dashboard on success
                window.location.href = 'dashboard.html';
            } catch (error) {
                console.error("Authentication failed:", error);
            }
        });
    }

    // --- Dashboard Logic ---
    const studentTableBody = document.getElementById('studentTableBody');
    if (studentTableBody) {
        // Mock data representing a fetch from the SQL database
        const mockStudents = [
            { id: 101, name: 'Alice Johnson', course: 'Computer Science', status: 'Active' },
            { id: 102, name: 'Bob Smith', course: 'Information Technology', status: 'Pending' },
            { id: 103, name: 'Charlie Davis', course: 'Software Engineering', status: 'Active' }
        ];

        // Using modern Array.map and template literals to generate UI
        const populateTable = (students) => {
            studentTableBody.innerHTML = students.map(student => `
                <tr>
                    <td>#${student.id}</td>
                    <td>${student.name}</td>
                    <td>${student.course}</td>
                    <td><span class="badge ${student.status === 'Active' ? 'bg-success' : 'bg-warning'}">${student.status}</span></td>
                </tr>
            `).join('');
        };

        populateTable(mockStudents);
    }

    // --- Logout Logic ---
    const logoutBtn = document.getElementById('logoutBtn');
    if (logoutBtn) {
        logoutBtn.addEventListener('click', () => {
            alert('Logging out safely...');
            window.location.href = 'index.html';
        });
    }
});