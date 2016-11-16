<gifts>
    <div class="flex one">
        <div class="gift">
            <h2>Hadiah yang tersedia</h2>
            <div class="flex three">
                <div class="gift-box">
                    <div class="gift-wrapper">
                        <img class="gift-img" src="../ch.jpg" alt="">
                    </div>
                    <button class="mainButton">Cord Holders <span class="label success">{gifts['cordholders']}</span></button>
                </div>
                <div class="gift-box">
                    <div class="gift-wrapper">
                        <img class="gift-img" src="../tshirt.jpg" alt="">
                    </div>
                    <button class="mainButton">T-Shirts <span class="label success">{gifts['t-shirts']}</span></button>
                </div>
                <div class="gift-box">
                    <div class="gift-wrapper">
                        <img class="gift-img" src="../mug.jpg" alt="">
                    </div>
                    <button class="mainButton">Mugs <span class="label success">{gifts['mugs']}</span></button>
                </div>
            </div>
        </div>
    </div>
    <script>
    var self = this

    obs.on('quota_updated',function(gifts){
        self.gifts = gifts
        self.update()
        
    })



    
    </script>
</gifts>