const statusIndicator = document.getElementById("statusIndicator");
const statusMessage = document.getElementById("statusMessage");
const checkHealthButton = document.getElementById("checkHealthButton");

async function checkHealth() {
  statusIndicator.textContent = "Checking...";
  statusIndicator.className = "status unknown";

  statusMessage.textContent = "Checking the backend health...";
  checkHealthButton.disabled = true;

  try {
    const response = await fetch("/health");

    if (!response.ok) {
      throw new Error("Health check failed");
    }

    const data = await response.json();

    if (data.status === "ok") {
      statusIndicator.textContent = "Healthy";
      statusIndicator.className = "status healthy";

      statusMessage.textContent =
        "The Express backend is running correctly.";
    } else {
      throw new Error("Unexpected health status");
    }

  } catch (error) {
    console.error(error);

    statusIndicator.textContent = "Unhealthy";
    statusIndicator.className = "status unhealthy";

    statusMessage.textContent =
      "Unable to communicate with the Express backend.";
  } finally {
    checkHealthButton.disabled = false;
  }
}

checkHealthButton.addEventListener("click", checkHealth);

// Check the backend automatically when the page loads.
checkHealth();

