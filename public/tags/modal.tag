<modal>
    <div class="modal">
        <input id="modal_1" type="checkbox" />
        <label for="modal_1" class="overlay"></label>
        <article class="modal-body">
            <header>
                <h3>Sociocaster Promo</h3>
                <label for="modal_1" class="close">&times;</label>
            </header>
            <section class="content modal-content">
                <h2> Selamat {participant.name}! </h2>
                <div class="gift-wrapper"><img class="user-img" src="https://graph.facebook.com/{participant.fbid}/picture?width=150&height=150"> </div>
                <p>kamu berhak mendapatkan</p>
                <h3>
                    <span if={participant.gift=='cordholders' }> 1 Cord Holder</span>
                    <span if={participant.gift=='t-shirts' }>1 T-Shirt Sociocaster</span>
                    <span if={participant.gift=='mugs' }>1 Mug Sociocaster</span>
                </h3>
                <div if={participant.gift=='cordholders' } class="gift-wrapper">
                    <img class="gift-img" src="../ch.jpg" alt="">
                </div>
                <div if={participant.gift=='t-shirts' } class="gift-wrapper">
                    <img class="gift-img" src="../tshirt.jpg" alt="">
                </div>
                <div if={participant.gift=='mugs' } class="gift-wrapper">
                    <img class="gift-img" src="../mug.jpg" alt="">
                </div>
            </section>
            <footer>
                <!-- <a class="button" href="#">See offer</a>-->
                <label for="modal_1" class="button dangerous"> Close </label>
            </footer>
        </article>
    </div>
    <script>
    var self = this
    var obs = this.opts.obs

    obs.on('show_modal',function(participant){
        self.participant = participant
        self.update()
    })
    </script>
</modal>