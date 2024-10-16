import DataTable from 'datatables.net-dt';

// Khởi tạo DataTables sau khi DOM sẵn sàng
document.addEventListener('turbo:load', () => {
    const dataTableElement = document.querySelector('#users-table');
    if (dataTableElement) {
        new DataTable(dataTableElement);
    }
});
