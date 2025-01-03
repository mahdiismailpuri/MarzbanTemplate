// Snow animation
function createSnowflake() {
    const snowflake = document.createElement('div');
    const symbols = ['❄', '❅', '❆'];
    
    snowflake.innerHTML = symbols[Math.floor(Math.random() * symbols.length)];
    snowflake.style.position = 'fixed';
    snowflake.style.color = '#ffffff';
    snowflake.style.textShadow = '0 0 2px rgba(255,255,255,0.8)';
    snowflake.style.userSelect = 'none';
    snowflake.style.zIndex = '9999';
    snowflake.style.pointerEvents = 'none';
    snowflake.style.fontSize = (Math.random() * 1.2 + 0.6) + 'em'; 
    snowflake.style.opacity = (Math.random() * 0.4 + 0.6);
    
    // Set initial position
    snowflake.style.left = Math.random() * window.innerWidth + 'px';
    snowflake.style.top = '-20px';
    
    document.body.appendChild(snowflake);
    
    // Animation properties
    let positionX = parseFloat(snowflake.style.left);
    let positionY = -20;
    let speed = Math.random() * 0.8 + 0.3; 
    let swing = Math.random() * 2;
    let swingAngle = Math.random() * Math.PI * 2;
    
    function updatePosition() {
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

// Create initial snowflakes
function initSnow() {
    const numberOfSnowflakes = 85; 
    for (let i = 0; i < numberOfSnowflakes; i++) {
        setTimeout(() => createSnowflake(), i * 50); 
    }
}

// Start snow animation when page loads
window.addEventListener('load', initSnow);

// Add new snowflakes periodically to maintain density
setInterval(() => {
    if (document.querySelectorAll('div').length < 200) { 
        createSnowflake();
    }
}, 1000); 
