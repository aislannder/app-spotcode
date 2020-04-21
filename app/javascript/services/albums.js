import Api from './api';

const AlbumsService = {
    index: () => Api.get('/dashboard'),
    show:  (id) => Api.get(`/albums/${id}`) //pega um elemento pelo seu id
}

export default AlbumsService;