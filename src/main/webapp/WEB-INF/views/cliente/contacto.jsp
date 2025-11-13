
<link rel="stylesheet" href="/css/UsuarioStyles.css" />

<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Contacto - GymFlow</title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
    />
  </head>
  <body>

  <%@ include file="barra_tareas.jsp" %>

    <div class="container">
      <header class="header">
        <h1>Contáctanos</h1>
        <p>Estamos aquí para ayudarte a alcanzar tus metas fitness</p>
      </header>
      <div class="contact-wrapper">
        <div class="contact-form">
          <h2>Envíanos un mensaje</h2>
          <form>
            <div class="form-group">
              <label for="nombre">Nombre completo</label>
              <input type="text" id="nombre" name="nombre" required />
            </div>
            <div class="form-group">
              <label for="email">Correo electrónico</label>
              <input type="email" id="email" name="email" required />
            </div>
            <div class="form-group">
              <label for="asunto">Asunto</label>
              <input type="text" id="asunto" name="asunto" required />
            </div>
            <div class="form-group">
              <label for="mensaje">Mensaje</label>
              <textarea
                id="mensaje"
                name="mensaje"
                placeholder="Cuéntanos en qué podemos ayudarte..."
                required
              ></textarea>
            </div>
            <button type="submit" class="btn-submit">
              <i class="fas fa-paper-plane"></i> Enviar mensaje
            </button>
          </form>
        </div>

        <div class="contact-info">
          <h2>Información de contacto</h2>

          <div class="info-item">
            <i class="fas fa-map-marker-alt"></i>
            <div>
              <h3>Dirección</h3>
              <p>Av. Fitness 123, Distrito Deportivo<br />Huancayo, Perú</p>
            </div>
          </div>

          <div class="info-item">
            <i class="fas fa-phone"></i>
            <div>
              <h3>Teléfono</h3>
              <p>+51 987 654 321</p>
            </div>
          </div>

          <div class="info-item">
            <i class="fas fa-envelope"></i>
            <div>
              <h3>Correo electrónico</h3>
              <p>contacto@gymflow.com</p>
            </div>
          </div>

          <div class="info-item">
            <i class="fas fa-clock"></i>
            <div>
              <h3>Horarios de atención</h3>
              <p>
                Lun - Vie: 6:00 AM - 10:00 PM<br />Sáb - Dom: 7:00 AM - 8:00 PM
              </p>
            </div>
          </div>

          <div class="social-media">
            <h3>Síguenos en redes sociales</h3>
            <div class="social-icons">
              <a href="#" title="Facebook"><i class="fab fa-facebook-f"></i></a>
              <a href="#" title="Instagram"><i class="fab fa-instagram"></i></a>
              <a href="#" title="Twitter"><i class="fab fa-twitter"></i></a>
              <a href="#" title="WhatsApp"><i class="fab fa-whatsapp"></i></a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script src="navegacion.js"></script>
  </body>

  <%@ include file="footer.jsp" %>
</html>
