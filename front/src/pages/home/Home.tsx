

const Home = () =>{
  return(
    <div>
    <header id="header" className="header fixed-top">
    <div className="container-fluid container-xl d-flex align-items-center justify-content-between">

      <a href="index.html" className="logo d-flex align-items-center">
        <img src="logo.png" alt=""/>
        <span>A Company</span>
      </a>



    </div>
  </header>


  <section id="hero" className="hero d-flex align-items-center">

<div className="container">
  <div className="row">
    <div className="col-lg-6 d-flex flex-column justify-content-center">
      <h1 data-aos="fade-up">Modern Supply chain Solutions</h1>
      <h2 data-aos="fade-up" data-aos-delay="400">We are team of talented designers making websites with Bootstrap</h2>
      <div data-aos="fade-up" data-aos-delay="600">
        <div className="text-center text-lg-start">
          <a href="#about" className="btn-get-started scrollto d-inline-flex align-items-center justify-content-center align-self-center">
            <span>Get Started</span>
            <i className="bi bi-arrow-right"></i>
          </a>
        </div>
      </div>
    </div>
    <div className="col-lg-6 hero-img" data-aos="zoom-out" data-aos-delay="200">
      <img src="hero-img.png" className="img-fluid" alt=""/>
    </div>
  </div>
</div>

</section>


<main id="main">

    <section id="about" className="about">

      <div className="container" data-aos="fade-up">
        <div className="row gx-0">

          <div className="col-lg-6 d-flex flex-column justify-content-center" data-aos="fade-up" data-aos-delay="200">
            <div className="content">
              <h3>Who We Are</h3>
              <h2>Expedita voluptas omnis cupiditate totam eveniet nobis sint iste. Dolores est repellat corrupti reprehenderit.</h2>
              <p>
                Quisquam vel ut sint cum eos hic dolores aperiam. Sed deserunt et. Inventore et et dolor consequatur itaque ut voluptate sed et. Magnam nam ipsum tenetur suscipit voluptatum nam et est corrupti.
              </p>
              <div className="text-center text-lg-start">
                <a href="#" className="btn-read-more d-inline-flex align-items-center justify-content-center align-self-center">
                  <span>Read More</span>
                  <i className="bi bi-arrow-right"></i>
                </a>
              </div>
            </div>
          </div>

          <div className="col-lg-6 d-flex align-items-center" data-aos="zoom-out" data-aos-delay="200">
            <img src="about.jpg" className="img-fluid" alt=""/>
          </div>

        </div>
      </div>

    </section>
    <section id="values" className="values">

      <div className="container" data-aos="fade-up">

        <header className="section-header">
          <h2>Our Values</h2>
          <p>Odit est perspiciatis laborum et dicta</p>
        </header>

        <div className="row">

          <div className="col-lg-4" data-aos="fade-up" data-aos-delay="200">
            <div className="box">
              <img src="values-1.png" className="img-fluid" alt=""/>
              <h3>Ad cupiditate sed est odio</h3>
              <p>Eum ad dolor et. Autem aut fugiat debitis voluptatem consequuntur sit. Et veritatis id.</p>
            </div>
          </div>

          <div className="col-lg-4 mt-4 mt-lg-0" data-aos="fade-up" data-aos-delay="400">
            <div className="box">
              <img src="values-2.png" className="img-fluid" alt=""/>
              <h3>Voluptatem voluptatum alias</h3>
              <p>Repudiandae amet nihil natus in distinctio suscipit id. Doloremque ducimus ea sit non.</p>
            </div>
          </div>

          <div className="col-lg-4 mt-4 mt-lg-0" data-aos="fade-up" data-aos-delay="600">
            <div className="box">
              <img src="values-3.png" className="img-fluid" alt=""/>
              <h3>Fugit cupiditate alias nobis.</h3>
              <p>Quam rem vitae est autem molestias explicabo debitis sint. Vero aliquid quidem commodi.</p>
            </div>
          </div>

        </div>

      </div>

    </section>
    <section id="counts" className="counts">
      <div className="container" data-aos="fade-up">

        <div className="row gy-4">

          <div className="col-lg-3 col-md-6">
            <div className="count-box">
              <i className="bi bi-emoji-smile"></i>
              <div>
                <span data-purecounter-start="0" data-purecounter-end="232" data-purecounter-duration="1" className="purecounter"></span>
                <p>Happy Clients</p>
              </div>
            </div>
          </div>

          <div className="col-lg-3 col-md-6">
            <div className="count-box">
              <i className="bi bi-journal-richtext" style={{color: "#ee6c20;"}}></i>
              <div>
                <span data-purecounter-start="0" data-purecounter-end="521" data-purecounter-duration="1" className="purecounter"></span>
                <p>Projects</p>
              </div>
            </div>
          </div>

          <div className="col-lg-3 col-md-6">
            <div className="count-box">
              <i className="bi bi-headset" style={{color: "#15be56;"}}></i>
              <div>
                <span data-purecounter-start="0" data-purecounter-end="1463" data-purecounter-duration="1" className="purecounter"></span>
                <p>Hours Of Support</p>
              </div>
            </div>
          </div>

          <div className="col-lg-3 col-md-6">
            <div className="count-box">
              <i className="bi bi-people" style={{color:" #bb0852;"}}></i>
              <div>
                <span data-purecounter-start="0" data-purecounter-end="15" data-purecounter-duration="1" className="purecounter"></span>
                <p>Hard Workers</p>
              </div>
            </div>
          </div>

        </div>

      </div>
    </section>


   

   
    <section id="faq" className="faq">

      <div className="container" data-aos="fade-up">

        <header className="section-header">
          <h2>F.A.Q</h2>
          <p>Frequently Asked Questions</p>
        </header>

        <div className="row">
          <div className="col-lg-6">
            
            <div className="accordion accordion-flush" id="faqlist1">
              <div className="accordion-item">
                <h2 className="accordion-header">
                  <button className="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq-content-1">
                    Non consectetur a erat nam at lectus urna duis?
                  </button>
                </h2>
                <div id="faq-content-1" className="accordion-collapse collapse" data-bs-parent="#faqlist1">
                  <div className="accordion-body">
                    Feugiat pretium nibh ipsum consequat. Tempus iaculis urna id volutpat lacus laoreet non curabitur gravida. Venenatis lectus magna fringilla urna porttitor rhoncus dolor purus non.
                  </div>
                </div>
              </div>

              <div className="accordion-item">
                <h2 className="accordion-header">
                  <button className="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq-content-2">
                    Feugiat scelerisque varius morbi enim nunc faucibus a pellentesque?
                  </button>
                </h2>
                <div id="faq-content-2" className="accordion-collapse collapse" data-bs-parent="#faqlist1">
                  <div className="accordion-body">
                    Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Id interdum velit laoreet id donec ultrices. Fringilla phasellus faucibus scelerisque eleifend donec pretium. Est pellentesque elit ullamcorper dignissim. Mauris ultrices eros in cursus turpis massa tincidunt dui.
                  </div>
                </div>
              </div>

              <div className="accordion-item">
                <h2 className="accordion-header">
                  <button className="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq-content-3">
                    Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi?
                  </button>
                </h2>
                <div id="faq-content-3" className="accordion-collapse collapse" data-bs-parent="#faqlist1">
                  <div className="accordion-body">
                    Eleifend mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Faucibus pulvinar elementum integer enim. Sem nulla pharetra diam sit amet nisl suscipit. Rutrum tellus pellentesque eu tincidunt. Lectus urna duis convallis convallis tellus. Urna molestie at elementum eu facilisis sed odio morbi quis
                  </div>
                </div>
              </div>

            </div>
          </div>

          <div className="col-lg-6">

            
            <div className="accordion accordion-flush" id="faqlist2">

              <div className="accordion-item">
                <h2 className="accordion-header">
                  <button className="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq2-content-1">
                    Ac odio tempor orci dapibus. Aliquam eleifend mi in nulla?
                  </button>
                </h2>
                <div id="faq2-content-1" className="accordion-collapse collapse" data-bs-parent="#faqlist2">
                  <div className="accordion-body">
                    Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Id interdum velit laoreet id donec ultrices. Fringilla phasellus faucibus scelerisque eleifend donec pretium. Est pellentesque elit ullamcorper dignissim. Mauris ultrices eros in cursus turpis massa tincidunt dui.
                  </div>
                </div>
              </div>

              <div className="accordion-item">
                <h2 className="accordion-header">
                  <button className="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq2-content-2">
                    Tempus quam pellentesque nec nam aliquam sem et tortor consequat?
                  </button>
                </h2>
                <div id="faq2-content-2" className="accordion-collapse collapse" data-bs-parent="#faqlist2">
                  <div className="accordion-body">
                    Molestie a iaculis at erat pellentesque adipiscing commodo. Dignissim suspendisse in est ante in. Nunc vel risus commodo viverra maecenas accumsan. Sit amet nisl suscipit adipiscing bibendum est. Purus gravida quis blandit turpis cursus in
                  </div>
                </div>
              </div>

              <div className="accordion-item">
                <h2 className="accordion-header">
                  <button className="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq2-content-3">
                    Varius vel pharetra vel turpis nunc eget lorem dolor?
                  </button>
                </h2>
                <div id="faq2-content-3" className="accordion-collapse collapse" data-bs-parent="#faqlist2">
                  <div className="accordion-body">
                    Laoreet sit amet cursus sit amet dictum sit amet justo. Mauris vitae ultricies leo integer malesuada nunc vel. Tincidunt eget nullam non nisi est sit amet. Turpis nunc eget lorem dolor sed. Ut venenatis tellus in metus vulputate eu scelerisque. Pellentesque diam volutpat commodo sed egestas egestas fringilla phasellus faucibus. Nibh tellus molestie nunc non blandit massa enim nec.
                  </div>
                </div>
              </div>

            </div>
          </div>

        </div>

      </div>

    </section>
  </main>


  </div>
  )
}


export default Home;