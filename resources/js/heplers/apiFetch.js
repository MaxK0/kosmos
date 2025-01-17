export default async function (method, route, body = null, isBlob = false) {
    const options = {
        method,
        headers: {
            Accept: 'application/json',
        }
    }

    if (localStorage.getItem('user-token')) {
        options.headers['Authorization'] = `Bearer ${localStorage.getItem('user-token')}`
    }

    if (body) {
        if (body instanceof FormData) {
            options.body = body
        } else {
            options.headers['Content-Type'] = 'application/json'
            options.body = JSON.stringify(body)
        }
    }

    const response = await fetch(`http://localhost:8000/api-kosmos${route}`, options)
    let result = null

    if (response.status === 401) {
        localStorage.removeItem('user-token')
        window.location.replace('/auth')
    }

    try {
        if (isBlob) {
            result = await response.blob()
        } else {
            result = await response.json()
        }
    } catch (e) {}

    return result
}
