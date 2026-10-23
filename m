Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792770719;
	b=Ur6I0V4NzZOAjVmVCDxuRQgtm10KSRgEbrEH01t0LwhDkIvzMQusf2nUd3cJRHGDc9bm
	 bNHhIVolG+XjmmOtuhsvcZqcOpngyRODhFA34+nkNQ5D1c82f4Gs0lk77SWwxvhZk8h7+
	 fLg9V/AeBQYXL0iVAnu0wU9YoTxx6V7ch/6/x8T85mi5IMxlV7s8gd904JlgHDxkzkjrf
	 vTcC4jZ6crokpM8+G1tijqsOrVznts5j7qo/DrAfztUxXcIU08Gl0eOvMPZaZNO+yrC8c
	 TadJAeSncPmhErYpeMgNqE6p6fyDyq/uRKcFrvSX/sZnB7BVn3/6OTDgFx8oJGO0NqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792770719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BVELYFhUkQg6E+aLDDF2h1iCF+DMetiL5pwlMqqw4pM=;
	b=c/PvR9ffN9fZSVovhgDisy100tyQdS8/0H1TBNSk7iDne7vYyyaEJdHI8QYPqudR5vZN
	 Eo/Zam2e8tblTbA1COtMk6AP7SZBiMbLizolPF8/9g491/YX9TTrYVgYLROLjcn6NWHfl
	 /R8rmlAAPrUiRlkD9cll8LKkPmH9bX+yRmfdL2jRTJPDRo2JdtqBhAN2GYBMrCSnOyV+3
	 ngCmCBQlQAu0ghmJ3eJTN9LE8znkQA4OUy3WC8JA8PAnnM60Cmrelhqkwh0iJTkW2iYse
	 EEyd7t8yaIs2fuUKfWKorfBr94MSeykbyJxQL1Lx4FQ/8DjcH0wqXInSZYMsW0V6DHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PKWOfr4t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E65606A31A
	for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 15:51:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4E65606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PKWOfr4t
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35f1f76ea84so1654925eec.1
        for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 08:51:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792770718; cv=none;
        d=google.com; s=arc-20260327;
        b=qU2Nv8sP+FwdCOjRHDVck2F2l6/tsOjAGNGCntrHjqbozNkzblOVvpAv7uWtPXYocC
         C7YMf/j/fZ2NntZsKAeL9scSTNXhmwcekgw80jX1ImMP9yAkLFwKKMHbnXvkHyVbapWH
         kGWSsD5mlTf8qsOxOd1GWxGzWiWIXAUXUt3IcEEW0lGSfumO9QEA/WaRyRi3s3NMdClq
         N6cXoDVyb2HlMUNZWWuahbe1lCtvEQO91POkYG67pYvUCkrCQCyMlauPg0ArDNIoGAcS
         4ecQ3rJI7QTR2Ahewel3WzArtGzIxCUhUhvv9cAGmM5FV1N+/PJjNwiwP1b5UoJm7c3H
         +paw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BVELYFhUkQg6E+aLDDF2h1iCF+DMetiL5pwlMqqw4pM=;
        fh=fwBIJRhdiScjxrPLIqxBOwyGAuI4fvJCJ1qkMiM1IeE=;
        b=I7JNxXT6tW7BUouMiLrtJ08TkTC8II/W263dItJyYQlME68H6UulR34Gsu4FWV039G
         ybrptlSKkXX4ovr7N1E5BK71RtXZ9995H4Mpiq+ny8vkhwE077B2JQNoazLxHgKYBxco
         qPgIVf65bGoauGssDY2uCEmphh8XVOGqhqsnEOMeDDoArNpK95ZcM5meEogiQX+9HU9H
         qktEXRd22GW45kYlfw5LeZOWJ1XTPx6bIXONc+e+WKO5pLdoAF9F5vHh2e4wmA13+t+Q
         vl36lPVA49EEXT8fpvOwBB+T6sw6EE6nNnxFpIqGbcvKg491o5+H6RyAXBEve16rGt3Y
         BTVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792770718; x=1793375518; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BVELYFhUkQg6E+aLDDF2h1iCF+DMetiL5pwlMqqw4pM=;
        b=PKWOfr4tjtlbxHtEeoltpYziJyproO/Li6O9GdCLJFr9aWBHas1vi2mMIYYMxCxZx7
         2qwul+JG72XQ8pjSsXAbYs6XKoFEOoSU/vjDdb7T6IaQ8Qigiu7to1s19hiA2cOR9Aw5
         AnyHD6bH+h/eSatAsguZqTE5HTPGNxcBD887NB4mB88HARz9hmYM4Jlp66N7loDOK4Ht
         OC0GoWAyY4TMQUA5+vZY11zJtmOT3mxCDiscu+0YCwVEsVDKKJ4YNTco+3d9OY3QULYw
         WszyAiBaEcPv7nLzr53bPihOZXEkaD9RsqRnZD5zkB4CyJ+b9peEYCeVu9YGtN5reSgT
         OcMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792770718; x=1793375518;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BVELYFhUkQg6E+aLDDF2h1iCF+DMetiL5pwlMqqw4pM=;
        b=t4wtyoN4jwCIJqKP1+Qj2//UdOPGBqtck+vY5oqf4+bq6mX0cBixHe41/N9gLNMhAP
         y7+8wGtSioj3rSeq6yXzozCx7NtrecHiOHEFgEe3YKxNfvRGro0we+UJwghplmbY9eOY
         rzCEqFolAHw9wNAv7YCUhkxyeeTpDhIlFbL5Bb+iwaG+iA83q6sc82rEr/2Mv8Kgvbar
         UtPd4aL/gyYIxHS05OKwq/JW6jZ5gcMiLWtqSMXIEl7pJ2EE1e4IRl/h/Mcq0hsKiBu0
         ao8tkt22MwsQRs6pcZ4CDnDTrxNwYLcoLxLRdM2zXQfW2WpcBBZ2mmkZONJRtFBaOU1q
         //DA==
X-Forwarded-Encrypted: i=1; AKwUvBxGOGbN5+rzwcV0b7IMoczNxmUv/pz3FMkqlRlm2N5yAbsK1d0pm9XCc3RgjDNUe14r9aXLQ5fpE6Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpi7dSfBrcMyHksevxJAfl3LOlHbI4qwDQ5ncKGNsLIE6ECinb
	z71mrEWs0tkaoladkZ0c/4k6sas2SwSdK4mD2o6KWeeGDuQ7PBmiW2w5K87JHUo328Zpjytee7W
	FC1cgkJNfhg2mKt2dgEANCrhXB8TCGNE=
X-Gm-Gg: AYBFou3veAaG9Io+XloPr6JOCo2ntKW5xBU5Yc8jf+qPrTBExy1QgkIcaxKOWEX90xr
	nlQxG313txYfC6IcSAVzmFMAX0PNkbdUK6edCyqP6YLue7QfnNm9NAz+QLICSvOxN9OYK6SK0AX
	uIwxBdnizWpvNoTNPTEdXhwWgK0AI6VcAxqvMXNnDiSl9huHuxvVA/AZNSU5aG2M1sseizZvQXM
	MiuWaHDsbMeFv6D42IjQ338izcUjt+M/VcqHqkwHz+qAkWi+1Bdx2Kh/ZQQAsjZ1vxx/LFsOPpk
	eS3Tw90RbPFqfcQBA+Nn5JfTmgZVGMsQWlU7k1EeTgrURXNaGBx2zA0A2jMg3oPxHu866saYt5S
	dMc6G49rqav1HHhvBicvN7twA7y2yW9X+bsnaCIdOc/l4epHEmuogfP5Nn0Vi+RUHDFTOa+d9Yc
	bbJQHgpsxp8/q1uZ284XpRkDc=
X-Received: by 2002:a05:7301:6189:20b0:34c:d1f2:b552 with SMTP id
 5a478bee46e88-369d90e3513mr3288744eec.4.1792770717671; Fri, 23 Oct 2026
 08:51:57 -0700 (PDT)
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <79b27ba6d0eb7a511f23607a4f3612d4f6911f24.1792687206.git.alx@kernel.org>
 <CAEHU8x9jET+vcrR0NpDz6t57egQG8TZqx5XtV52srH9ZRvdxSQ@mail.gmail.com>
 <atpnWiYQzs_HZ1Q7@debian> <CAFs=pgZZeOg7vmkyTjwZdnafYFxn+Yogd9usEzX9Bmv87Z-P4A@mail.gmail.com>
In-Reply-To: <CAFs=pgZZeOg7vmkyTjwZdnafYFxn+Yogd9usEzX9Bmv87Z-P4A@mail.gmail.com>
From: Christopher Bazley <chris.bazley.wg14@gmail.com>
Date: Fri, 23 Oct 2026 16:51:45 +0100
X-Gm-Features: AclHuK-y_QRAicXPp4Szf-4ZHkf3L9I1uDgT4lxGvxb6I-ks2qTkoau0wN52udw
Message-ID: <CAEHU8x-Zs8E=e5qoJYRB2ecunpcZWoazsj9Pnxq5bn6bS4ndMQ@mail.gmail.com>
Subject: Re: [PATCH] man/: SYNOPSIS: Remove GNU forward-declarations of
 parameters for lengths of array parameters
To: "Michael Kerrisk (man7.org)" <mtk@man7.org>
Cc: Alejandro Colomar <alx+linux-man@kernel.org>, linux-man@vger.kernel.org, 
	Michael Kerrisk <mtk.manpages@gmail.com>, Sam James <sam@gentoo.org>, 
	"Carlos O'Donell" <carlos@redhat.com>, "Joseph S. Myers" <josmyers@redhat.com>, 
	Martin Uecker <uecker@tugraz.at>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Fri, Oct 23, 2026 at 12:54=E2=80=AFPM Michael Kerrisk (man7.org)
<mtk@man7.org> wrote:
>
> Hello,
>
> On Thu, 22 Oct 2026 at 16:54, Alejandro Colomar
> <alx+linux-man@kernel.org> wrote:
> >
> > Hi Chris,
> >
> > > Date: 2026-10-22 18:29:31+0100
> > > From: Christopher Bazley <chris.bazley.wg14@gmail.com>
...
> > > You know your customers better than I do. If they expect GNU C semant=
ics,
> > > then it seems reasonable to document those semantics using GNU C synt=
ax.
>
> The customers clearly do NOT expect GNU C syntax.
>
> My preference would be the earlier status quo: standard C syntax, with
> an explanation in the manual page text that explains the relationship
> between the arguments. The current proposed patch is a compromise: it
> has the disadvantage of being nonstandard C, but does at least clearly
> hint at the relationship between the arguments.

I am curious to know what your attitude would be to lesser-known
standard C syntax.

For example:

int pipe(int pipefd[static 2]);

is standard C syntax, and requires the caller to pass a pointer to the
first of at least 2 array elements, unlike

int pipe(int pipefd[2]);

which has the same semantics in ISO C as

int pipe(int *pipefd);

Thanks,
Christopher
