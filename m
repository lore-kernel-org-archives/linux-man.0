Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27F03C64ED6
	for <linux-man@archiver.kernel.org>; Sun, 26 Feb 2023 21:58:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbjBZV6O (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 26 Feb 2023 16:58:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbjBZV6N (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 26 Feb 2023 16:58:13 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4108993FF
        for <linux-man@vger.kernel.org>; Sun, 26 Feb 2023 13:58:12 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id q16so4361426wrw.2
        for <linux-man@vger.kernel.org>; Sun, 26 Feb 2023 13:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9j1cyUob8ShX8xe51JaFu+tgld5hLeF2Xs92yMu2Bw=;
        b=o/113d7Ppao2Dnh+3TAFLVcgiX+afs8mkWAitCZDC+HiUxe6fV5cFzNtUcFRjjdtTV
         Ew0bfazn0bbiUi/pRCq31IGQP0LUNfgGl1fyP5XfdNp7GG1vYI9DIf0orOnMW2uPteyW
         xVH0yZA6SCl8IHnvseYR3ndsSwB2jw8DNALgE9ofRVEUYUcdqLj1uMdkyyOtCJb+kM+m
         K0vlScvtrQuehFbgzZtEhOq693wj4OZMK2mV6OwhaGk5RA+8DBZP1sgNPbRbuJI6TcVp
         yYnA5CjFOL6F45QizH29+mYz/B7IXGHaaPDPP4CcO+qqFriafO3J9qR4N3Ei7IAkrLKd
         9Ijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V9j1cyUob8ShX8xe51JaFu+tgld5hLeF2Xs92yMu2Bw=;
        b=48rtb0dY9z9mNaC9EEgwIG/4pZSO/iMgC8qw0wcc/LGUGnLmdRI0XC+PepyvvPmtud
         9jDPqQ09AL8V/EsUyRQ9tV6sl2hH5Hyo+V7YkaqAjv0/Ifia4Rqq1JbTDfYbWnxzu2Z0
         nGK0lPi6YyF+mG4H3T8H3ZE+rAJSOZrxwmONR3GtWPeu9YNzfvwsgJNyee/Soc2PBFKz
         4U24GhqjTkOMIXHzu7SJu6OfIK2OQ8bN0luuvNxKU/HXGkIm17lsKqqYKUp1E8tjioox
         5lkXGqyNzLOGCilH1iBsAJY6pZhtDNpPSUYPi88We9t1TNh1VIG7jcDVa4MZRYFxRKnm
         2ImA==
X-Gm-Message-State: AO0yUKV2fdGGwrp/wuDsH7qpOQAYLiVEnjDOm9ofP/SKbPX1GHQ9rfjS
        04oJKw7r7P4ijojw9BcA0mbLA9SaTdM=
X-Google-Smtp-Source: AK7set/mVNMxlsPvBzKx4yFzYKzh0S+Q0TL6rCXZlAm+SLeUsT6zskC7ihfUChueHxSY6qqm+68dXw==
X-Received: by 2002:adf:fb06:0:b0:2c5:4c1f:3c9 with SMTP id c6-20020adffb06000000b002c54c1f03c9mr18901773wrr.49.1677448690692;
        Sun, 26 Feb 2023 13:58:10 -0800 (PST)
Received: from [192.168.0.160] ([170.253.36.171])
        by smtp.gmail.com with ESMTPSA id q5-20020adff505000000b002c70a0e2cd0sm5435564wro.101.2023.02.26.13.58.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Feb 2023 13:58:10 -0800 (PST)
Message-ID: <63d2e471-b167-77a6-b713-5f76ff63fb96@gmail.com>
Date:   Sun, 26 Feb 2023 22:58:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] ptrace.2: Add details about usage of
 PTRACE_GET_SYSCALL_INFO
Content-Language: en-US
To:     Fotios Valasiadis <fvalasiad@gmail.com>, linux-man@vger.kernel.org
Cc:     lineprinter0@gmail.com, "Dmitry V . Levin" <ldv@strace.io>
References: <20230225105601.6079-1-fvalasiad@gmail.com>
From:   Alejandro Colomar <alx.manpages@gmail.com>
In-Reply-To: <20230225105601.6079-1-fvalasiad@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------X0zlmHhpZEvNznO00Kwmw1Bh"
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------X0zlmHhpZEvNznO00Kwmw1Bh
Content-Type: multipart/mixed; boundary="------------nYa1NtqzNkR1xZb7Q093ox0V";
 protected-headers="v1"
From: Alejandro Colomar <alx.manpages@gmail.com>
To: Fotios Valasiadis <fvalasiad@gmail.com>, linux-man@vger.kernel.org
Cc: lineprinter0@gmail.com, "Dmitry V . Levin" <ldv@strace.io>
Message-ID: <63d2e471-b167-77a6-b713-5f76ff63fb96@gmail.com>
Subject: Re: [PATCH] ptrace.2: Add details about usage of
 PTRACE_GET_SYSCALL_INFO
References: <20230225105601.6079-1-fvalasiad@gmail.com>
In-Reply-To: <20230225105601.6079-1-fvalasiad@gmail.com>

--------------nYa1NtqzNkR1xZb7Q093ox0V
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Fotios,

On 2/25/23 11:56, Fotios Valasiadis wrote:
> Document the role of PTRACE_O_TRACESYSGOOD option in connection with PT=
RACE_GET_SYSCALL_INFO.
>=20
> Signed-off-by: Fotios Valasiadis <fvalasiad@gmail.com>
> Cowritten-by: Dmitry V. Levin <ldv@strace.io>
> Complements: fc91449cb "ptrace.2: Document PTRACE_GET_SYSCALL_INFO"
> ---
>  man2/ptrace.2 | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/man2/ptrace.2 b/man2/ptrace.2
> index 55d9fd36d..ad0543b0b 100644
> --- a/man2/ptrace.2
> +++ b/man2/ptrace.2
> @@ -1111,6 +1111,15 @@ stop.
>  .B PTRACE_SYSCALL_INFO_NONE
>  No component of the union contains relevant information.
>  .RE
> +.IP
> +Note that in case of

"Note that" is usually redundant.
See:
<https://lore.kernel.org/linux-man/20210729223535.qvyomfqvvahzmu5w@localh=
ost.localdomain/>
<https://lore.kernel.org/linux-man/20230105225235.6cjtz6orjzxzvo6v@illith=
id/>

> +syscall entry or exit stops, the data returned by

Please use semantic newlines.  See man-pages(7):

   Use semantic newlines
       In  the source of a manual page, new sentences should be started o=
n new
       lines, long sentences should be split into lines at clause breaks =
(com=E2=80=90
       mas, semicolons, colons, and so on), and long clauses should  be  =
split
       at  phrase  boundaries.   This convention, sometimes known as "sem=
antic
       newlines", makes it easier to see the effect of  patches,  which  =
often
       operate at the level of individual sentences, clauses, or phrases.=



> +.B PTRACE_GET_SYSCALL_INFO
> +is limited to type
> +.B PTRACE_SYSCALL_INFO_NONE
> +unless
> +.B PTRACE_O_TRACESYSGOOD
> +option is set before the corresponding ptrace stop has occurred.

You should say
=2EBR ptrace ()
right?
Or is unformatted ptrace common in this page?

Cheers,

Alex

>  .\"
>  .SS Death under ptrace
>  When a (possibly multithreaded) process receives a killing signal

--=20
<http://www.alejandro-colomar.es/>
GPG key fingerprint: A9348594CE31283A826FBDD8D57633D441E25BB5

--------------nYa1NtqzNkR1xZb7Q093ox0V--

--------------X0zlmHhpZEvNznO00Kwmw1Bh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmP71eoACgkQnowa+77/
2zIDgQ//QicEh454Gyc00Cag6MMGh5hpcoLcnurU2yZJDq/DmfcptVrdGFDlVHZx
8bfxZ3UHWn8C3y2xPfgkp0PeKAj58uLxoDOWwkPYVtEYkq04v3bIIOgzZK4iO77t
muVJMpaMcMxliG2p2ecjCycpI7Itn5KQo0Zf/5JIJFgukFSSMvpWmIRwkiOhkePt
KLMsmDu84HTxQlVI+pabl2JFT9wNE2gAtD+UP1L1QbOhVCJQ9vqpt0pKI/6sPJP2
9PKdgWw8VxoIPrHOazniM0VOOkRC/Uu+E4RgTx1jDdEPunUVBcw7SKYfFk13oc5x
EsmH0ajl+CoDMu1OOdp44mA8erJ9zkDD4YBORjJKo/ClmxWHpEKiQlPJEG3TQzjG
1ydUsvrFJ9quiWtEymJfYTFCZFniAY2SfMUSzTN2zUK2X/YJ7bcCBwxJ2H4U3n4J
n4G0b9e9uHtUFXrPgfwacLpWgz/4bbPhtWBHR+SomjeJWERLukPKt+vKsLwWjRhr
7tZilpymTUJzr60ohBNP8+MmBA8YFPqxRRPY7SdQKsRXW/mR/r8ZdFTODWHnJZpO
Ga/S8T/AL1MNL76jU51KyZ043i96u7/VZ0ZFx5vOy8gDS/3yaUTwi9s8YqGDqMsu
+fgyHH2JvBOaH9xXU6u9ZlqfmpiMvn9+kXR1fDiT0J+AW/EfANU=
=X662
-----END PGP SIGNATURE-----

--------------X0zlmHhpZEvNznO00Kwmw1Bh--
