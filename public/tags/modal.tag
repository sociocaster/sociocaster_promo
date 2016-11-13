<modal>
    <div class="modal">
        <input id="modal_1" type="checkbox" />
        <label for="modal_1" class="overlay"></label>
        <article>
            <header>
                <h3>Congratulations!</h3>
                <label for="modal_1" class="close">&times;</label>
            </header>
            <section class="content">
                <h1> Selamat {participant.name}! </h1>
                <p>kamu berhak mendapatkan</p>
                <h3>
                    <span if={participant.gift=='cordholders' }> 1 Cord Holder</span>
                    <span if={participant.gift=='t-shirts' }>1 T-Shirt Sociocaster</span>
                    <span if={participant.gift=='mugs' }>1 Mug Sociocaster</span>
                </h3>
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