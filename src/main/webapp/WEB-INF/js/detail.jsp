<script>
    var count = 1;
    var plusButton = document.getElementById("plus");
    var minusButton = document.getElementById("minus");
    var displayCount = document.getElementById("quantity");
    plusButton.onclick = function () {
        count++;
        if (count >= 1) {
            displayCount.innerHTML = count;
        } else {
            count = 1;
        }

    };
    minusButton.onclick = function () {
        count--;
        if (count >= 1) {
            displayCount.innerHTML = count;
        } else {
            count = 1;
        }
    };
</script>