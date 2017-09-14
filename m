From: NeilBrown <neilb-IBi9RG/b67k@public.gmane.org>
Subject: Re: [RFC PATCH manpages] write.2, fsync.2, close.2: update description of error codes
Date: Fri, 15 Sep 2017 08:36:56 +1000
Message-ID: <87ingk9abb.fsf@notabene.neil.brown.name>
References: <20170720194227.7830-1-jlayton@kernel.org> <1503683981.22608.0.camel@redhat.com> <87h8wsiog4.fsf@notabene.neil.brown.name> <1503920855.4563.12.camel@redhat.com> <87pobfgo9q.fsf@notabene.neil.brown.name> <1504004058.4679.7.camel@redhat.com> <87efrjb2mn.fsf@notabene.neil.brown.name> <1504784132.4954.12.camel@redhat.com> <1504796087.3561.7.camel@primarydata.com> <874ls9diij.fsf@notabene.neil.brown.name> <1505126785.4916.7.camel@redhat.com> <87poawc390.fsf@notabene.neil.brown.name> <1505229616.28831.26.camel@redhat.com> <87efrbbne1.fsf@notabene.neil.brown.name> <1505305391.4822.13.camel@redhat.com> <87ingm9n04.fsf@notabene.neil.brown.name> <59BA36C5.9000506@bfs.de>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <59BA36C5.9000506-fPG8STNUNVg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wharms-fPG8STNUNVg@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 14 2017, walter harms wrote:

> Am 14.09.2017 01:50, schrieb NeilBrown:
>>=20
>> Since 4.13, errors from writeback are more reliably reported
>> to all file descriptors that might be relevant.
>>=20
>> Add notes to this effect, and also add details about ENOSPC and EDQUOT
>> which can be delayed in a similar manner to EIO - for NFS in particular.
>>=20
>
> I never read EDQUOT  before but it is real:
>
> see:
> http://elixir.free-electrons.com/linux/latest/source/security/keys/reques=
t_key.c
>
> -EDQUOT
>  * if insufficient key quota was available to create a new key

EDQUOT existed long before security keys.
It's original purpose is to report Disk QUOTa problems.  If you write to
a file and you have exhausted you quota, you get EDQUOT.

http://elixir.free-electrons.com/linux/latest/source/fs/quota/dquot.c#L1318

NeilBrown

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEG8Yp69OQ2HB7X0l6Oeye3VZigbkFAlm7BIoACgkQOeye3VZi
gbn8wBAAmCIJT0icPHEDrcU/o753YyZhK9dCOQajtRUXWW1gJB3IAzxhJF+SHn4B
TE9jW88r0530owC3wRvrqjIOMbY7GLLDrhYBF9iM0cnyeW7UVa8w+TBa6YitDs57
MlorjUMzYwmJZbABKoyIHs0tKZTORAu+qAxpjOJkLjEPd97YSiEXgQwGhwlnxiJy
Xe37BZp6NiTxr8favzv0rLgWiva1P3egGPxpWded7wvH8ddppRVNK+HcCHehvHcs
StHmm6+eXhTnykdQ6aeQks1F6VV5l3B6Qw5aHTWoOzJ/GiDEBZk8I3wqeLOBlVxF
i9txSVPQTYrB5kKrN8Ffp/0rPefJ6BrLnY+wu2SImB4pPIN2NYkTH08qpSvNNkfS
aupWBcDr95JDI7XvVfKtijEynADQZD6mMEG/iVOetcvj7Fm1zX+J0tDOc/1zAQ39
gnUWlMNpEcwN6Rw7Z9HEOPYVRCPq4Ra45n8X6lmGXBQBMommsx4xXXKGlMPNQu5C
xrRSh/kUiuZA5bhUpwjNbQ+XxHGB13VurI6VF9W/kehTuAh2ncxCs82Z+ffxtMPx
GNoM9vO4eWt3Q32Re7fQHUwiE04yKqvmKZR/VElEEtIZvs2UQHL4hAh1e2gnTeLX
jmAU/e/dLK+tcH740qQ7NQW3dYDP2o0jX3oFlx7IIGujqB/tDuo=
=WHrk
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
