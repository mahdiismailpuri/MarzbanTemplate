function createSnowflake() {
    const snowflake = document.createElement('div');
    const symbols = ['❄', '❅', '❆'];

    snowflake.className = 'snowflake';
    snowflake.innerHTML = symbols[Math.floor(Math.random() * symbols.length)];
    snowflake.style.position = 'fixed';
    snowflake.style.color = '#ffffff';
    snowflake.style.textShadow = '0 0 2px rgba(255,255,255,0.8)';
    snowflake.style.userSelect = 'none';
    snowflake.style.zIndex = '9999';
    snowflake.style.fontSize = (Math.random() * 1.2 + 0.6) + 'em';
    snowflake.style.opacity = (Math.random() * 0.4 + 0.6);
    snowflake.style.cursor = 'pointer'; // افزودن قابلیت کلیک
    snowflake.style.pointerEvents = 'auto'; // فعال کردن کلیک

    // Set initial position
    snowflake.style.left = Math.random() * window.innerWidth + 'px';
    snowflake.style.top = '-20px';

    // Add click event listener
    snowflake.addEventListener('click', function (e) {
        explodeSnowflake(this, e.clientX, e.clientY);
    });

    document.body.appendChild(snowflake);

    // Animation properties
    let positionX = parseFloat(snowflake.style.left);
    let positionY = -20;
    let speed = Math.random() * 0.8 + 0.3;
    let swing = Math.random() * 2;
    let swingAngle = Math.random() * Math.PI * 2;

    function updatePosition() {
        if (snowflake.isExploded) return;

        positionY += speed;
        swingAngle += 0.02;
        positionX += Math.sin(swingAngle) * swing;

        // Reset if out of bounds
        if (positionY > window.innerHeight + 20) {
            positionY = -20;
            positionX = Math.random() * window.innerWidth;
        }

        // Keep within horizontal bounds
        if (positionX > window.innerWidth) {
            positionX = 0;
        } else if (positionX < 0) {
            positionX = window.innerWidth;
        }

        snowflake.style.transform = `translate(${positionX}px, ${positionY}px)`;
        requestAnimationFrame(updatePosition);
    }

    requestAnimationFrame(updatePosition);
}

function explodeSnowflake(snowflake, x, y) {
    snowflake.isExploded = true;

    // Create explosion particles
    for (let i = 0; i < 8; i++) {
        const particle = document.createElement('div');
        particle.innerHTML = '❄';
        particle.className = 'explosion';
        particle.style.left = x + 'px';
        particle.style.top = y + 'px';
        particle.style.color = '#ffffff';
        particle.style.position = 'fixed';
        particle.style.transform = `rotate(${i * 45}deg)`;
        document.body.appendChild(particle);

        // Remove particle after animation
        setTimeout(() => {
            particle.remove();
        }, 500);
    }

    // Remove original snowflake
    snowflake.remove();
}

// Create initial snowflakes
function initSnow() {
    const numberOfSnowflakes = 50;
    for (let i = 0; i < numberOfSnowflakes; i++) {
        setTimeout(() => createSnowflake(), i * 50);
    }
}

// Start snow animation when page loads
window.addEventListener('load', initSnow);

// Add new snowflakes periodically to maintain density
setInterval(() => {
    if (document.querySelectorAll('.snowflake').length < 200) {
        createSnowflake();
    }
}, 1000);
