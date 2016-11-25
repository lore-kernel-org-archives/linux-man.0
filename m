From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH draft_keys 0/7] Minor edits
Date: Fri, 25 Nov 2016 04:00:43 +0300
Message-ID: <20161125010043.GA25181@obsidian>
References: <51643019-bb42-4066-c824-c55b9e668ac6@man7.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51643019-bb42-4066-c824-c55b9e668ac6-ASgREoAs3yw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello.

There are some minor edits to keyrings(7) (and one minor typo fix for
keyctl(2)).

One additional idea: add_key(2) and request_key(2) have some duplication
regarding special keyrings (as already noted in comments there), maybe
add overview information regarding them (along with constant names)
to the Keyrings section of the keyrings(7) and then reference it from
add_key/request_key (with the notes regarding non-applicability of
requestor keyring in add_key and such).

Another thought is to document group keyring (that it is present since
beginning but has never been implemented), since it has a constant
definition and one may think (upon possible discovery in headers) that
it is just some undocumented feature.

Eugene Syromyatnikov (7):
  keyctl.2: tfix
  keyrings.7: minor clarification rearding storage method used in
    keyrings
  keyrings.7: spacing fix
  keyrings.7: minor clarification regarding decision whether to store
    big_key in tmpfs or not
  keyrings.7: tfix
  keyrings.7: tfix
  keyrings.7: information regarding pre-3.17 limits on
    root_maxbytes/root_maxkeys

 man2/keyctl.2   |  1 -
 man7/keyrings.7 | 20 ++++++++++++--------
 2 files changed, 12 insertions(+), 9 deletions(-)

-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
