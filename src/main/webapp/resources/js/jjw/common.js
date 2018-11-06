function calculateDayJjw() {
    const startDay = new Date($('#datetimepicker1 input').val());
    const endDay = new Date($('#datetimepicker2 input').val());
    if (endDay <= startDay) {
        startDay.setDate(startDay.getDate() + 1);
        $('#datetimepicker2').data("DateTimePicker").date(startDay);
    } else {
        const betweenDay = (endDay - startDay) / (1000 * 60 * 60 * 24);
        $('#betweenDay').html(`<strong>${betweenDay}박 ${betweenDay + 1}일</strong>`);
    }
}

$(function () {
    var beforeValue;
    $('#roomNumber').on('click', function () {
        beforeValue = parseInt(this.value);
    })

    $('#roomNumber').on('change', function () {
        const peopleNum = function (number) {
            const peopleHtml = `<div class="col-md-4" style="visibility: hidden;">
            <div class="form-group">
              <label>hidden</label>
              <input type="text">
            </div>
          </div>
          <div class="col-md-4">
            <div class="form-group">
              <label>어른 수</label>
              <select class="form-control input-lg" name="adultNumber${number}">
                <option>1</option>
                <option selected>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
                <option>6</option>
                <option>7</option>
                <option>8</option>
                <option>9</option>
              </select>
            </div>
          </div>
          <div class="col-md-4">
            <div class="form-group">
              <label>아이 수</label>
              <select class="form-control input-lg" name="childNumber${number}">
                <option>0</option>
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
                <option>6</option>
                <option>7</option>
                <option>8</option>
                <option>9</option>
              </select>
            </div>
          </div>`;
            return peopleHtml;
        }
        const thisValue = parseInt(this.value);
        if (beforeValue < thisValue) {
            for (let i = beforeValue + 1; i <= thisValue; i += 1) {
                $('#roomNumberAnchor').after(peopleNum(i));
            }
        } else if (beforeValue > thisValue) {
            for (let i = beforeValue; i > thisValue; i -= 1) {
                for (let j = 0; j < 3; j += 1) {
                    $('#roomNumberAnchor').next().remove();
                }
            }
        }
    })
})