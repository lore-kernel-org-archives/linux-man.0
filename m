Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793689874;
	b=OVpMjn3ZWWoDZmJkt8jBY6jw1PYdEAP/Yr4mSyFGsmn8OeASP+Yp4hDdayx4kzNRFT7q
	 e5ypplNxKpJPMaCcQYYBHcY85xpyelc1uDt3BSGdyOhXOKGGriwIAHFV8/6T5GbsitZj5
	 qZvBQ6xgYkgJYDdS8EossGuKEgGsRkIfQ0GwB4QaeYTvf46V7mEdZ+wL4/Kz1XSh4jAwa
	 UvfAanpekpUBcb0o1yIYxjpe/T19Fm68ryWSkerIYzPEOqIk50wRyEM9U5cNieLDpDQJ+
	 N5OM6VKnr6/DQF2vtwLY3NVFjDXaq1hu2KMIFKGzqDbvJZuJ0kYl+pxIoMpbAUfEK5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793689874;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=GM71SYzbA48Y0ZchmOVfzeIwgEvcMfXF48gPrEARRsU=;
	b=eenvtfOP5g8skMBR/Rmf9fHrRRejexUAOE60eG38AJEf0Sekzxh460XvORRWt80u3zbL
	 zb0MD2N4ubarlKyCxxhsaRX2PVLkjaFrxlkG0Ydot2tX9+u3CMqH+ppmD/o2AhkEs82/s
	 n6TNwEoT+XmCkvOUgcaJEg21kH/i1TdhrUwt6HwqfEIrraEWn0Mn6pLrYw1LS556LEwjt
	 ZvglEJUGmBJO7kkk0Un0h7VwgHtpzTGsR3oOj31tYRfagMgYW25KGxb6659FW8uQuQKx1
	 PJFTPY9SJcYwNwG+OleUkDZ5HdLq1W0yd12NvHJEA1uOuv2NnLUGCVJhedJ7tf7jS8g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Rfvkihu0;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=YgG2tomj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1B2606A329
	for <linux-man@vger.kernel.org>; Tue,  3 Nov 2026 07:11:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC1B2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Rfvkihu0;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=YgG2tomj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793689872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GM71SYzbA48Y0ZchmOVfzeIwgEvcMfXF48gPrEARRsU=;
	b=Rfvkihu07RgTgl1HlNiplFUm+qJVaAMVa7HHWWJ2coKiCKn1fg279JX6ip16GLZhwtq4Re
	t4lJF3r8qrVUwssv2kFXcxgO+wJ+j8HCKB/TZFWOvMrVh+v5y920oWwfv+HgQPJa3P+5+3
	4p1J6XlUVD5iqSzRl2ySFrk2+pzS4fQ=
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-356-rxWO4E8pPhyDFj3jTwnA3w-1; Tue, 03 Nov 2026 02:11:11 -0500
X-MC-Unique: rxWO4E8pPhyDFj3jTwnA3w-1
X-Mimecast-MFC-AGG-ID: rxWO4E8pPhyDFj3jTwnA3w_1793689870
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a3451ea93so6012808eec.1
        for <linux-man@vger.kernel.org>; Mon, 02 Nov 2026 23:11:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793689870; cv=none;
        d=google.com; s=arc-20260327;
        b=dtnXJBOswhQjJVTBbdqGZ6XnvqB0npXqk4mqlcD7RkQo5I8LU47rZFrEEhx5KQ718y
         I54/1X938eg05hGlR2gXRSaGX62bHjy5shMZSiRnfp+haQQRQc9xO0agu63JArNeKgeb
         HMe+fi24dvSm0iPuO54G7qplKn6p1qNhoEounPepM/7VbuYqVC7kAmaGYUvejPRIAi6p
         /PYBNNcWasNRZqPX5BKWEifloTc1gzDiCfX0g4d77luacu45/KeaZ3i3TpQLIKL01Tl/
         URG4xB48VhMAzMV7kZvSQ8tIu5C4BDwP/1vrFjMeL/Iz3N3Tnfoe/YtjVYGU03GDFgWc
         68uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GM71SYzbA48Y0ZchmOVfzeIwgEvcMfXF48gPrEARRsU=;
        fh=s9Q+wCk/4CGqC+z0z9NwcnFJ5uTM219VGgUtBDgTTZA=;
        b=XfvLensl0i6oILyaFYPO5wYxiWFzt3RjK5V7zLhRsw1RfbxiZPFFPJa0OgS9rBdjU3
         73hRXgo+fv+AZpOPk9yfDuxk6i7Ofm6/L5ujv4Sk3wmiS6AA+fI/ilT7A4HLZM6uxTRm
         DL/eSCytzT+YeMPkFk6F/iNkTfPWN2D/mMOOoBV3z7mFcFK9+TCp0TlK2no55XjQ4unb
         Syk6Y89veJ/lOqFUHKGuyjrCKqEbF50LffpxcDbL5TtX7lgHCjL753z1GbrhkHwour8Z
         iKCmKDINVd33mxmGMWJe91AAmgRiyd+Dpqnz1iWlBldLe2jsVKN9sWlOCOGW/Q6yuzOX
         NJcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793689870; x=1794294670; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GM71SYzbA48Y0ZchmOVfzeIwgEvcMfXF48gPrEARRsU=;
        b=YgG2tomjiqpavqJCgpA+yRpr1Zg9DCQjTQNUvQe1AXdBIbiWtmLWyk8YL3DL+z9OXe
         AgyXV7wrJnI6KItVTCrzY6ex3LUB1qqTtUjEvmT4xl6/yEyVaWGU9I/26s94ZcbVg2/2
         fuTDH4NV44tkOjmwCBqxZbzHmg7iZl8n5buiTRBf3eJ7u+UCrcm9Tol4B4ajA/dE78lk
         EMfDN+Oxki5WzrBCqzBQ9Fx/bXElZWxSdbsTTGPjpLnWzoZisCkZOBLKDjAhDYHVRbqn
         +LvV5WXECTHUQd4nG0eMIjUMBt1wNX2HK8k8zM6ZzCenhDn6W056ddNTwOsfCOkyO2Ov
         SMVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793689870; x=1794294670;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GM71SYzbA48Y0ZchmOVfzeIwgEvcMfXF48gPrEARRsU=;
        b=d1SUVdy01ydH54KocizWt2QXQV7WfFttJBW4wrC7zGjJ013mHeWPyNEAec0r/4rHuT
         giAwJnxLLZNHCeP42Ds5JK6naf/kEjRkgP5hfQUy3MncA0fK7QtCtHsqTOmsD8J8aXrb
         kBROxqyDs6cnsJTS8B6mO8u0oC17qt8d/JZlsDv7Xa4NLZZhnv9/t9SfvOEpe30Iw/0x
         QBEuyJPtibk3iONFLhFBNiCT9z0dL8QkbACbibKFSZ/moSsacnPX/E7gMNiq/hal8CBT
         lqo8q6ZkuTKwN4hnN0bnFhR3lHtQ4uy7BWuFSyq8s2WOLIH94fuGyYK0aE7LNd6kt0kM
         6Utw==
X-Forwarded-Encrypted: i=1; AKwUvByrtXENkKSAferrO/e5WsT2+34rMbBmkyfJr3veuDZLJqLJU2b9z2UrfrZwtO57lx0HwHwb1OSga3k=@vger.kernel.org
X-Gm-Message-State: APuU4Z93dPyrMLMiJkdgYCT8Uvzqkgd95cSztBRW3uleQ3GLCD1VQrB+
	OsYDwzqrIGod29H8es0vlDMuAVovv5SfsPF1T6fuCOU3vSJCwPYUK2cts+fIPjJtHzf7u9VualX
	A1k5M2j30cDZAoLRVNmPDt9Ut7i9508WJdjQnU7J9Z/H2YO0JwgXZ+40gHlVvFzv61+jJY9o5H7
	kU5F5VZFJwd4V3wD+nF6LO5dd7OxPhoZn42b0Zq4ZT3xPEDdU=
X-Gm-Gg: AYBFou3ustRxr5r1od6ctCb2EY9BJSont9Xu7gk0APH6E+gXoyn92nkzM8qF4Kt1cTI
	gr1Bx+C5tXzLWnCk5203PfXVMdKAdFpTF/deF0+rtOmGa9GFNcLjUhZHIpsyCTbmNyexoP74drL
	J74yx1lKcSRB6F5AM4prAwFzNkAGo8C7rxfMYZ0wZVKHzqEnELUktiqgLU3zXHkGvk8VHE/p61V
	cjsXDoF9cqh5x7LpE5xVDcgDjilufYQ9CbjzET+yVIwysQwJyFieGjItWtYh8AA3mAJjwX5mS//
	TIc=
X-Received: by 2002:a05:7022:3a03:b0:152:9e88:daaa with SMTP id a92af1059eb24-1ac5f181628mr21230904c88.36.1793689869761;
        Mon, 02 Nov 2026 23:11:09 -0800 (PST)
X-Received: by 2002:a05:7022:3a03:b0:152:9e88:daaa with SMTP id
 a92af1059eb24-1ac5f181628mr21230864c88.36.1793689869207; Mon, 02 Nov 2026
 23:11:09 -0800 (PST)
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <9d4eec62-bfab-4cf9-ac48-c77dd57b60ac@redhat.com> <aukT75oZFuvhwiEd@devuan>
In-Reply-To: <aukT75oZFuvhwiEd@devuan>
From: Michal Schorm <mschorm@redhat.com>
Date: Tue, 3 Nov 2026 08:10:52 +0100
X-Gm-Features: AclHuK_Q2JS9N7LZg6fFrdc8xqzAphDnp-aNkNN9pI1XyBWzXxU8kfNYa7GUFog
Message-ID: <CALC7GWzhb81jNjvDyymfWQP6eXXM2OZ4LhtM=uYNWQ8TK=KpgQ@mail.gmail.com>
Subject: Re: Two copyright notices missing in 6.20?
To: Alejandro Colomar <alx@kernel.org>
Cc: Xavier Leroy <Xavier.Leroy@inria.fr>, "Carlos O'Donell" <carlos@redhat.com>, 
	linux-man <linux-man@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

There's a typo (Linus / Linux) in the commit restoring Linus' notice:
https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/commit/?id=3D03=
4b29a5f2686f647d12e75bf6da4bd30f97db0d



Michal

--

Michal Schorm
Senior Software Engineer
Databases Team
Red Hat

--

On Tue, Nov 3, 2026 at 12:22=E2=80=AFAM Alejandro Colomar <alx@kernel.org> =
wrote:
>
> Hi Carlos, Xavier,
>
> > Date: 2026-11-02 11:24:25-0500
> > From: Carlos O'Donell <carlos@redhat.com>
> >
> > Alejandro,
> >
> > I did a quick audit through 6.20 since we're looking to ship an update =
in Fedora.
> >
> > - Xavier Leroy =E2=80=94 pthread_once.3
>
> Xavier asked me to remove his name from the pages when I told him about
> picking the old pthread_*() pages from glibc and Debian.
>
>         commit 13151ec525a21101dabb2528784bf9a86b1280f4
>         Author: Alejandro Colomar <alx@kernel.org>
>         Date:   2023-10-03 16:57:29 +0200
>
>             pthread_*.3: Remove AUTHOR section; add copyright; adapt TH
>
>             Xavier asked that his name be removed from the AUTHOR section=
, and since
>             we don't use that section in this project, we can just wipe i=
t.
>
>             Add copyright notices to the pages, with Xavier as the origin=
al author,
>             and me, who will maintain them from now on.  Xavier ACKed the
>             Linux-man-pages-copyleft license.
>
>             Adapt the TH line:
>
>             -  Specify the date as (date).
>             -  Specify the project name in the 4th arg.
>             -  The first arg, the page name, must be the same as the file=
 name.
>
>             Suggested-by: Xavier Leroy <Xavier.Leroy@inria.fr>
>             Signed-off-by: Alejandro Colomar <alx@kernel.org>
>
> Here's a quote from an email from Xavier:
>
> | Date: Sun, 21 May 2023 11:40:12 +0200
> | From: Xavier Leroy <Xavier.Leroy@inria.fr>
> | Message-ID: <CAH=3Dh3gFakgz3xcH63h-5nO0L9LuSy2Xr5b2riwpJ1o4L3DzuRg@mail=
.gmail.com>
> |
> | To answer your question:
> | - I don't think it's a good idea to take these man pages "as is" and dr=
op
> | them in the man-pages project, because they are probably obsolete and
> | incomplete.
> | - However, if you or others would like to use these man pages as a star=
ting
> | point for a comprehensive, up-to-date and maintained documentation for
> | POSIX Threads functions in Linux, you're most welcome.
> | - In both cases, I'd like my name and e-mail address to be removed from=
 the
> | man pages, as I no longer support them.
>
> And a follop-up email:
>
> | Date: Sun, 21 May 2023 19:29:19 +0200
> | From: Xavier Leroy <Xavier.Leroy@inria.fr>
> | Message-ID: <CAH=3Dh3gF3F-tOq6-zYKf63_JhR3tRZ9NFMiTpX2YEjhhjDGr7Hw@mail=
.gmail.com>
> |
> | I'm happy with the man-pages-copyleft  license.  If you need me to writ=
e a
> | more formal message for the licensing of these pages, let me know.
> |
> | No other requests than 1- removing my name, and 2- updating the pages a=
s
> | much as you and others can.
>
> I'm not sure why I kept his name in the copyright notices back then.
> I thought I had asked him about it, but I can't find that discussion.
>
> Anyway, I've CCed Xavier now.  Xavier, are you okay with your copyright
> notices being transformed to a generic one that says this?:
>
>         Copyright, the authors of the Linux man-pages project
>
> > - Linus Torvalds =E2=80=94 setreuid.2
>
> Seems a mistake.  Fixed now.  Thanks!
>
> > At the top level the following people have had their notices removed bu=
t I didn't
> > see them acknowledge that removal on the mailing list, or in your final=
 audit here:
> > https://lore.kernel.org/linux-man/unavr5u2uynqfvj7iymgvsptq4k5s5b4ex7ha=
vl36zro4bbua4@fqpjhnsuu5ln/
> >
> > Should we add these back?
> >
> > I can only assume the Michael Kerrisk consented,
>
> He didn't.  We talked in person, and he asked his notices to be
> restored, which I believe I did.
>
>         $ grep -rn Copyright.*Kerrisk | wc -l
>         1224
>
> Did I miss any?
>
> > but I don't think you explicitly
> > mentioned this in any email I read with a Message-id. Would you do so f=
or the record?
>
>
> Have a lovely night!
> Alex
>
> --
> <https://www.alejandro-colomar.es>

