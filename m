Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 392A6C4332F
	for <linux-man@archiver.kernel.org>; Sun,  4 Dec 2022 20:22:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230246AbiLDUV6 (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 4 Dec 2022 15:21:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230038AbiLDUV5 (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 4 Dec 2022 15:21:57 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7FAE62D6
        for <linux-man@vger.kernel.org>; Sun,  4 Dec 2022 12:21:56 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id v124-20020a1cac82000000b003cf7a4ea2caso10383586wme.5
        for <linux-man@vger.kernel.org>; Sun, 04 Dec 2022 12:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zWyovB9Ju/Y2o/5mKEibAD5hqk78B6fvcEF9akxo+zw=;
        b=PgeRGaslugTNhVfjhCDztCjNlxvPwWhafGcqYM2jAy00FHjnTfiLlJnYlh8oHRVSdu
         3AALO+Hwn7dwGVBE066/OajPjaAfuQhmqKa/+ADegLk/EL0hwz2IhJYL4WpFaPzbdmyO
         ZKxC6UC7HIov2bomB5KRncJqGk7s86oqAzImm0mv2uML9cEvSYPiS3UK7ba57R3P6RGA
         NEhbLDDdxyX2DRXn89I6HEK/9kkGnAKs2jlTCcjSiMaXZSVBHpQlxLQPdRlWZ9iKlaJu
         Y0XSqex6n/91pjvKFLTBefjvcjikPRtnxL0ECRuYxJY5mW0LFAHIISWI5Tn7XPBeRPPU
         HRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zWyovB9Ju/Y2o/5mKEibAD5hqk78B6fvcEF9akxo+zw=;
        b=m2NJ5bZ3EnmCPw31IPy5HsbrmkSzx+s0/BsMygnzW/TTsd0OwK1I9W5Zh0ZBk8QqkT
         cMcFWk+dSDeOjmqHtodL6RuIzD9BxTbEjuk7cvNBhfcZ2OG2axe38YT5rT5XGR+VV02Q
         SuxUnjp58fFI357taqSzSI+GaPmPSLKgelTkLEHvPwkFlvnA5VCLUbwL10ishpx2bbj0
         NI4xZ9KZcvQjmX6ngzB70o0yxJNo/4cAEF8cE7dU5kcvZ91SPum7wXVFJGKvHCs42nCJ
         5Uqrfy6kz9HkqTK7XocN0WUwwyWoI3BaS/8kjkvE6avvWlBI3wOOhdfSE+JFGCo0dxyf
         NxkA==
X-Gm-Message-State: ANoB5pmhJFy14YboarNJXkSCTuCDmVosXxJmzPn3/nAZlTZXC6u/ZcKA
        bxVwcDMegpaD7cGpxn4p/o8=
X-Google-Smtp-Source: AA0mqf6035jFYTP5nWAxA3oe7qgvkmnIKaOB715vXwg6BhS71uobiz9uxA6bavyqrZGiLpZTxStALw==
X-Received: by 2002:a05:600c:554b:b0:3d0:88b4:9cda with SMTP id iz11-20020a05600c554b00b003d088b49cdamr7628594wmb.114.1670185315428;
        Sun, 04 Dec 2022 12:21:55 -0800 (PST)
Received: from [192.168.0.160] ([170.253.36.171])
        by smtp.gmail.com with ESMTPSA id n5-20020adff085000000b00236c1f2cecesm15189878wro.81.2022.12.04.12.21.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Dec 2022 12:21:55 -0800 (PST)
Message-ID: <e71702fb-fc8e-025a-df6b-93072f684662@gmail.com>
Date:   Sun, 4 Dec 2022 21:21:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: Issue in man page wavelan.4
Content-Language: en-US
To:     Helge Kreutzmann <debian@helgefjell.de>
Cc:     mario.blaettermann@gmail.com, linux-man@vger.kernel.org
References: <20221204090722.GA1131@Debian-50-lenny-64-minimal>
From:   Alejandro Colomar <alx.manpages@gmail.com>
In-Reply-To: <20221204090722.GA1131@Debian-50-lenny-64-minimal>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------S96aRvZBOBUHjmFawo3QjSbg"
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------S96aRvZBOBUHjmFawo3QjSbg
Content-Type: multipart/mixed; boundary="------------ldNSc3bruzNfu4Gdxf3qwD0k";
 protected-headers="v1"
From: Alejandro Colomar <alx.manpages@gmail.com>
To: Helge Kreutzmann <debian@helgefjell.de>
Cc: mario.blaettermann@gmail.com, linux-man@vger.kernel.org
Message-ID: <e71702fb-fc8e-025a-df6b-93072f684662@gmail.com>
Subject: Re: Issue in man page wavelan.4
References: <20221204090722.GA1131@Debian-50-lenny-64-minimal>
In-Reply-To: <20221204090722.GA1131@Debian-50-lenny-64-minimal>

--------------ldNSc3bruzNfu4Gdxf3qwD0k
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCk9uIDEyLzQvMjIgMTA6MDcsIEhlbGdlIEtyZXV0em1hbm4gd3JvdGU6DQo+IFdpdGhv
dXQgZnVydGhlciBhZG8sIHRoZSBmb2xsb3dpbmcgd2FzIGZvdW5kOg0KPiANCj4gSXNzdWU6
ICAgIGVuYWJsZSB0byBkaXNhYmxlIOKGkiBlbmFibGUgb3IgZGlzYWJsZQ0KPiANCj4gIlNv
bWUgb2YgdGhlIG1lbnRpb25lZCBmZWF0dXJlcyBhcmUgb3B0aW9uYWwuICBZb3UgbWF5IGVu
YWJsZSB0byBkaXNhYmxlIHRoZW0iDQo+ICJieSBjaGFuZ2luZyBmbGFncyBpbiB0aGUgZHJp
dmVyIGhlYWRlciBhbmQgcmVjb21waWxlLiINCg0KRml4ZWQuICBUaGFua3MuDQoNCi0tIA0K
PGh0dHA6Ly93d3cuYWxlamFuZHJvLWNvbG9tYXIuZXMvPg0K

--------------ldNSc3bruzNfu4Gdxf3qwD0k--

--------------S96aRvZBOBUHjmFawo3QjSbg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmONAWEACgkQnowa+77/
2zI/Lw//b4VAXu+r6HUv+wWJ6HEknAqjZWVqYz5RnQVX898Akj0ECANIQ+Lx98Pb
DIFU1CfrfSmXPWefqeK6KF6si5FmYqBPyzQ3iYA4L9VT0/AXC4OTsd6CDL/UMvbX
BSIt/kw2mbgw9aifbnyocXVMyhEDmCCudXYqc0XSkZzC5kvrmQA9l2m3geiE0QKn
GnLJj2Mxij3w+j2Bza/hwzJR1YM1qou4WlUf7QkR5JAyrv50K4k5IdeHjze7x5de
UoSD9+ihppFpyqMKU2i4KfCYBzQ1g5ltJZTMpvm6mogo6NWoAsrSO67Gl6OHQT3T
aDuIiAEAQvKANTxVXJHxOkTAGx/t4VpAFNnbz/sPLPWoxwLm0QWnjYxbN5YxIH5c
pzEfyR0MMvGz0mKdLC6BeEvkaDaHSpqx9Qz4iswp2bcU7fa263NSefuV+f2BqlzE
bqgP5JxrHvmkV7TTKoItQGlIA2qe3UEA0ia2Y49wGHsgdiTr3+cfBdjxhafuDUyi
B3QF0wqIU2+X6LbMjYDoeW6t9p6qUGzvmNzOqgFa3LmrcrIT9XWA68Lav/m2c6mW
ciZzmGOfMc+cn7PnK5QGRmiWigz8Dqbb/n39uKHhEoeu0G+EfT8UNmwQ+Zp3m+pQ
jPpULox2MXmOWRCwmU/xXmHocgWOLxKKskwVJoXYfsSfxcZfvis=
=b2og
-----END PGP SIGNATURE-----

--------------S96aRvZBOBUHjmFawo3QjSbg--
