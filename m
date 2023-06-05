Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C0B8C7EE23
	for <linux-man@archiver.kernel.org>; Mon,  5 Jun 2023 11:41:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232768AbjFELlz (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 5 Jun 2023 07:41:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232079AbjFELlx (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 5 Jun 2023 07:41:53 -0400
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19B3CE6
        for <linux-man@vger.kernel.org>; Mon,  5 Jun 2023 04:41:52 -0700 (PDT)
References: <14cbb4e3-9302-8065-2320-978181fbede0@gmail.com>
 <20230605113836.8496-1-alx@kernel.org>
User-agent: mu4e 1.10.3; emacs 29.0.91
From:   Sam James <sam@gentoo.org>
To:     Alejandro Colomar <alx.manpages@gmail.com>
Cc:     linux-man@vger.kernel.org, Alejandro Colomar <alx@kernel.org>,
        Yedidyah Bar David <didi@redhat.com>
Subject: Re: [PATCH v1b] isalpha.3: Move NOTES to CAVEATS, and clarify some
 Undefined Behavior
Date:   Mon, 05 Jun 2023 12:41:24 +0100
In-reply-to: <20230605113836.8496-1-alx@kernel.org>
Message-ID: <871qiqcf0o.fsf@gentoo.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

--=-=-=
Content-Type: text/plain


Alejandro Colomar <alx.manpages@gmail.com> writes:

> Reported-by: Yedidyah Bar David <didi@redhat.com>
> Signed-off-by: Alejandro Colomar <alx@kernel.org>
> ---
>
> I suggest this instead.

lgtm & thanks!

This is something that's often got wrong by folks.

>
>  man3/isalpha.3 | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>



--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iOUEARYKAI0WIQQlpruI3Zt2TGtVQcJzhAn1IN+RkAUCZH3J+F8UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0MjVB
NkJCODhERDlCNzY0QzZCNTU0MUMyNzM4NDA5RjUyMERGOTE5MA8cc2FtQGdlbnRv
by5vcmcACgkQc4QJ9SDfkZBdnwD/QZsenrgSqBR5tUJvJAf5OJj83gcep2wF1kj0
Wbw5Jj4BALV6LUpfIuC8p+5wLEqHBSu4A/TFVK/7DX1RT5nimQ4H
=FmM1
-----END PGP SIGNATURE-----
--=-=-=--
