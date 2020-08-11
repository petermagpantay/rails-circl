
const initFlatpickr = () => {
    $("#basicDate").flatpickr({
        enableTime: true,
        dateFormat: "F, d Y H:i",
        time_24hr: true
    });
};

export { initFlatpickr }