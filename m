From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/4] Makefile: Don't leave $(GROFF_LOG) files behind
Date: Wed, 13 Apr 2016 19:28:10 -0400
Message-ID: <20160413232810.GS6588@vapier.lan>
References: <20160414010434.1a7bdcfc.alex.miller@gmx.de>
 <20160414011304.289a6494.alex.miller@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sjhEW4yFowW3T7c3"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160414011304.289a6494.alex.miller-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Miller <alex.miller-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--sjhEW4yFowW3T7c3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 14 Apr 2016 01:13, Alexander Miller wrote:
> Convert "GROFF_LOG" into a shell variable local to the
> recipe for "check-groff-warnings" target such that the
> temporary file is only created when needed.

Acked-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
-mike

--sjhEW4yFowW3T7c3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXDtYJAAoJEEFjO5/oN/WBxV4QAIHelRlcSVXelGPe2xZPWFCg
XbDa4UWrJg3orKNu3XvKTuVKHM7NPWXo6DQnuzMg8Eon7+j3Lj9NuHWYtHA6UlCf
aqZ9bl9evEW6avWAjuH3T8690M0+efJY4iEEUZRheUth86o1/egO2sf6+ZvRq95s
/V7y0WVVUhx+MCIc2ySQnTJ9yxbRjSYMc7SHYdt9x+jmKUB5iUjb7yxUGdWSCm7q
uDGvdEOlGJtVUQhWtvcoKbVRjszxG33Am0DHiRhSPYDarP8oQpQZtyW5au5T10uW
F4rY8N4idYOQwMCZKl4u2AqL0lYhb2GzaSaAs4UT1IeHzaJQsWpgP0nDhQDTO0W9
oTqqenju7tWiD6A62IgRwiTk13zg2O936KRe0wyZiZ1nxEYIPgehhDL61aYuljz9
N/Ko9GaGbdrtyfB/U9wBVzNzd1MKRS5pFN4JmMwR3olUXE3/QSA9n5LuTDJkfVEb
rsvZNwzSqLEt49TFSP8Um4fHehz2K4PQyEXOl5ZneDS55RP0ELD0ZVi1n/7E8P8s
PBLhBGWx2+V70VE+2VQA3vzKgW/rcwFGjMcAuVvDqOdS6ndUR/LgrHKHQs7ZJAp7
4JzGfSh20wGe2fClGdF430O67bBIRVoVHqglT9xM8+Dz5UFAXUvbiiIibxoTWgbP
xkXKZN8X1yfm3iPk+gST
=x1F8
-----END PGP SIGNATURE-----

--sjhEW4yFowW3T7c3--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
