From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [man-pages PATCH] Add note about calling fclose(NULL)
Date: Tue, 29 Jan 2013 13:44:28 -0500
Message-ID: <201301291344.29011.vapier@gentoo.org>
References: <1695270.M7m4ekngnN@storm>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1375988.FQZgNMdEPX";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1695270.M7m4ekngnN@storm>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Jarosch <thomas.jarosch-XXsH3GEs1jrby3iVrkZq2A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--nextPart1375988.FQZgNMdEPX
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 29 January 2013 11:24:43 Thomas Jarosch wrote:
> --- a/man3/fclose.3
> +++ b/man3/fclose.3
> @@ -97,6 +97,10 @@ on disk the kernel buffers must be flushed too, for
> example, with .BR sync (2)
>  or
>  .BR fsync (2).
> +Also it's undefined behavior to call
> +.BR fclose ()
> +with a NULL pointer.
> +
>  .SH "SEE ALSO"
>  .BR close (2),
>  .BR fcloseall (3),

i wonder if it'd be better placed in the DESCRIPTION section
-mike

--nextPart1375988.FQZgNMdEPX
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJRCBiMAAoJEEFjO5/oN/WBG4kQANTKnNBXU4na/eJGRB6O8QU2
Gd53UGBjTtGhq7vZqgdgjgEGCdwWOf64KQ2dTK1nXe1F258k2pmrzBBG6utJHL78
mEFflWPuPx2gugszMqmq2ylgi3omQveHD1EsiS822/nQpVeGrH86ZEQpAftneasW
45FImKAWUxj6v9E/Gy5h40OIFecn8yR08LyhaHOXnlSSbM9NLy+tH5I3X7AO8+7j
9wcciqnE/awcZ96cAGP/fNo9MprE3d7XSu+fqZcBRNfWgWPTx7wpjDuVrRZTRf1c
PlSpXj66gWF27ikhdVWYxW9tDg3m8c6qplxcifQYz6XrkDpz9HA+B3xn7x6QUL1R
k3p/l3ZSJ+9U03BWf4RPXZba5lTK9+wrLBEPjvCO7S4CMrKxbV7Gd6nWVGWENLUA
PsEzIuxvkie50IqyJYHBr1BpQ2VnWWjwkPykDfm9n0Im1N4dhVE+ibKb4BFUpPJ+
eZyIjtyuHzXeH9uApfqbk8jydW9wLVno9HuWKFGGk9sYhBN1nQH7rXo2Kwf4jyoj
eSYr+l8zWzajb4XotKKhcyuKVRX9zPapF8BW5ArL9LrQu1MOL6F8ExxznR55jmW+
nOJ7cBWXXyItxJ4w8zowJxYv+bWa35pHYaS934aaNlud+3pKPDHkhXvcY3pTwoFo
v38RNanYhXHx8HVN54mp
=q7f4
-----END PGP SIGNATURE-----

--nextPart1375988.FQZgNMdEPX--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
