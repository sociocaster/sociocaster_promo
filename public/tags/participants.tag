<participants>
    <div class="flex one">
        <div class="participants">
            <h2> Partisipan</h2>
            <div class="flex one">
                <input class="search" type="text" oninput={searchParticipant} name="keyword" placeholder="Cari Partisipan..." autocomplete="off"></label>
            </div>
            <div class="flex one">
                <table class="primary ptable">
                    <thead>
                        <tr>
                            <th>Nama</th>
                            <th> Profil</th>
                            <th>Hadiah</th>
                            <th> Diambil? </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr each={value , key in participants.filter(filterParticipants)}>
                            <td>
                                <img class="user-img" src="https://graph.facebook.com/{value.fbid}/picture?width=50&height=50">                                <span class="name">{value.name}</span>
                            </td>
                            <td><a href="{value.profile}" target="_blank"> {value.profile}</a></td>
                            <td>
                                <span class="gift-name" if={value.gift=='cordholders' }> 1 Cord Holder</span>
                                <span class="gift-name" if={value.gift=='t-shirts' }>1 T-Shirt Sociocaster</span>
                                <span class="gift-name" if={value.gift=='mugs' }>1 Mug Sociocaster</span>
                            </td>
                            <td if={!value.is_claimed}><a href="#" onclick={claimGift}> Ambil </a> </td>
                            <td if={value.is_claimed}> Ya</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <script>
    var self = this
     var self = this

    obs.on('participants_updated',function(participants){
        self.participants = participants
        self.update()
        
    })

        searchParticipant(e) {
            this.update()
        }
        filterParticipants(item) {

            if (this.keyword.value.length <= 0) {

                return true

            } else {
                if (item.name.toLowerCase().indexOf(this.keyword.value.toLowerCase()) > -1) {

                    return true
                } else {
                    return false
                }

            }
        }

        claimGift(e){
         
            obs.trigger('claim_gift',e.item.value)
        }

    
    </script>
</participants>