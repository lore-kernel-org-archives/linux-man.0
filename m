Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27918C001B0
	for <linux-man@archiver.kernel.org>; Sun, 16 Jul 2023 01:18:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbjGPBSj (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sat, 15 Jul 2023 21:18:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbjGPBSi (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sat, 15 Jul 2023 21:18:38 -0400
Received: from xry111.site (xry111.site [89.208.246.23])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C791C2723
        for <linux-man@vger.kernel.org>; Sat, 15 Jul 2023 18:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
        s=default; t=1689470314;
        bh=b6UPIDxEM6MBc6ZjYAcz3+Iczuwl+LsR8WqWZyevD3Y=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=Gn+LIcKqIT4DVqOiJG4jA6P2LH5Cu1uwTkDmFoKEhDgulycMHWNbnwHJ4g5QrARcy
         gIFB3rEOXyVvecVOaMpZQkvXw8E61oA5LpvKj9LWCU4NN39uqwInU3hfQ1lgLtIcxJ
         KtR+nRCvksS4PRgrxBMRT9MCtl27UKlKk6YgAiaM=
Received: from localhost.localdomain (xry111.site [IPv6:2001:470:683e::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
        (Client did not present a certificate)
        (Authenticated sender: xry111@xry111.site)
        by xry111.site (Postfix) with ESMTPSA id 1204266374;
        Sat, 15 Jul 2023 21:18:33 -0400 (EDT)
Message-ID: <1855d0c68cbae144e6f5613ee4a6f109cd5e3562.camel@xry111.site>
Subject: Re: [PATCH] crypt.3: The library is "libcrypt", not "libcrypto"
From:   Xi Ruoyao <xry111@xry111.site>
To:     alx@kernel.org
Cc:     linux-man@vger.kernel.org
Date:   Sun, 16 Jul 2023 09:18:32 +0800
In-Reply-To: <6d635c03-3e05-a8d6-4578-5704867c6d86@gmail.com>
References: <20230715184118.1580451-1-xry111@xry111.site>
         <6d635c03-3e05-a8d6-4578-5704867c6d86@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On Sun, 2023-07-16 at 02:59 +0200, Alejandro Colomar wrote:
> Hi Xi!
>=20
> On 2023-07-15 20:41, Xi Ruoyao wrote:
> > libcrypt is the password hashing library, and libcrypto is a
> > completely
> > different library (OpenSSL cryptography library).
>=20
> Thanks!=C2=A0 My mistake.
>=20
> >=20
> > Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> > ---
> > =C2=A0man3/crypt.3 | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/man3/crypt.3 b/man3/crypt.3
> > index 1f3e4792e..ad14cb4f7 100644
> > --- a/man3/crypt.3
> > +++ b/man3/crypt.3
> > @@ -20,7 +20,7 @@
> > =C2=A0crypt, crypt_r \- password and data encryption
> > =C2=A0.SH LIBRARY
> > =C2=A0Encryption and decryption library
>=20
> Is the above line accurate, or should we improve it?

Hmm, I'm not sure.

This library is only a password hashing library today (and also in UNIX
6 :), but when it provided encrypt() function (from UNIX 7 to Glibc
2.27) it can really do "encryption and decryption" (in a broken way
though).

But I guess we can change "password and data encryption" to "password
hashing", at least.

> > -.RI ( libcrypto ", " \-lcrypto )
> > +.RI ( libcrypt ", " \-lcrypt )
>=20
> I see that another page probably also needs to be fixed.
> Would you mind fixing it too,if appropriate, in this patch?

Ah indeed, I didn't catch it.

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
