Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8722367D3
	for <linux-man@vger.kernel.org>; Sat,  1 Aug 2026 14:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785594379; cv=pass; b=LQtliPBR0hwXnvmWgMfK8otnls6XyJo+p6zahLn0UM3AsdZmYaAga6Z04VVchhhRwUh6UBVthkGvM66y4DCrDCsF0rjlwLXWZkEgRkxFVMOQmRmDlNrLamEOGtK8FlR381RF4AbHcYnLWL7j/8ug6Ya19Dm+SdSJfoGuZSnQqRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785594379; c=relaxed/simple;
	bh=xih4mVcuMyT4tbsddZPHErs1UmnwpcDNZIi/lhWfsVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I1oNrw0VOMP+SgUP8Al40WWh74235/abmlldGsCrBhUIpeqNBJNo/tNlR0y/v7VeetEwnn8gxJQxQLt/4RHKo+g0/5flZv5VbRxr/e4yAzgEDBUfX5EfNVWfNAm5yss1XXYm6vlKR1R4mX+dhuBsw569ecl3PQDws8BIH1gAi50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XxNtVUzf; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XxNtVUzf"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so1455364a91.2
        for <linux-man@vger.kernel.org>; Sat, 01 Aug 2026 07:26:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785594378; cv=none;
        d=google.com; s=arc-20260327;
        b=ruwltv6LMBz1RVI6k2Sc1jTzNHvAoEKvyrMqVwtKJprfWUcFIuWpmdxX8kec6bMP7x
         gVmv4SeFX06TtjDuyi+3IP68rDJO43QzfkQXSE1IzeBZsliebALDT1vSqG8UcTtchQf0
         9aGWuLOnEfdk2HiI7n3LmQFtHriXImkRtGPHOhP2vhE+bq6fG2drI+s3p92wmg+g318d
         QbM8RYBZaUfsTR4j40G7MpvO0sbn7SiTxmqEOyb6/fXPAuHBbHeyFcjibG0lJxBWm/wx
         Wg6JXCNm6KKJbTu2maAmOrZ8e/PudJ6SRkUGpxgR8Sq3+D3+l7+xhGWqsgomMUKcsuqp
         4vAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zHwEBn8zl3bm2REpIWVt0TsvCx9Ymy8jmKGnW7lJWSE=;
        fh=j6NM4xRQP+YKUJ+RuWcMH4UxEnclLpJ7WG4Zdc3HdiI=;
        b=Sku4nHATLwjj78un4kj8eYh+/6osOW9mmzGKhbEtNBHNM8pPQlByx86qUU7wTdaBNF
         0Y7i4cAWk7qivzT+kW5+uGFM7J+wFzBuGuMp3CiiahBMdUhGILzYk5EHiA1kAeutO92d
         8zqYHspUCiWmGPsK051Rn7/GPX2ea6t5Rgzmdz/1ogO3WBdekXtoBjRDLWXmzoUAZyR4
         hUhHGo7dHbSaGUawbG3mO+DEpjTw3GcwHB7Uvt6mnQq5aMrdG0p+81xAuNIg4r/KpOId
         lZ2g6+X4DEev4CcdHD3Hb6NufsWft3gEkcuGtzhwSekncVy7cxyhgOIKCMVSFxEe6Slg
         t+Qw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785594378; x=1786199178; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zHwEBn8zl3bm2REpIWVt0TsvCx9Ymy8jmKGnW7lJWSE=;
        b=XxNtVUzfNujRPmciUjLyzp9EqkPV+9KtCxNN1uxCBpuwp0HrSk1EhfrUbA6nxz+4lg
         1xld0HBdVbFv4aZO8pRuSmmYjPl1TQyDfH+tmPIaYuPh+y8RV5O1cm+jzn9OsZ6xpJpx
         Livdk90UWrBnFqHPXbIGNpsfT4wTj4o1Rq0gQ7mv1PyjxhswnaLEw4aQjWogzzxk5ipr
         kUhMxwZ1wAQhCBNzzywtB1FFkMlbF/gqWCLj+Ol/Vp81Z7zD+iop9xcPZNy1HRbj88YX
         LqJ5IN9vS1GLz4i9ZbnaS8yrItjADP2bB8a6sQJLojYTmjxbwrzXK8hd+m8H3cqEAtKS
         ma5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785594378; x=1786199178;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zHwEBn8zl3bm2REpIWVt0TsvCx9Ymy8jmKGnW7lJWSE=;
        b=SqD0e5qq0gf/7gxBBQDp0NuN+OKByeqMHDjlmRFLh6u2EotLesqZDmtGrhdhUprjPK
         5TXcrR1aKfKy6OTScYVDzaNWvCCST1URWiz+dMZllDFZjaTcueQ4cr8awh/g6J2BKQs8
         hHEaWRaINemHjtP8Rg8tuJRTol5THS2c9vqpdoAsV2d5Wh1Ief4HTPni946oswSGWL2v
         9+0J9zC7iEWSVtQyvwYmPWw+OHns8mA4XrKU3KiGSC33KM56NfwM8UYzjfE+paJu8tVx
         GfpKOtTYfQqUbVjymp1u0qk1u2JVL1nxtvzajshuO1d5dPEhXqxaCgo+zF7x0V/X85rJ
         7W9Q==
X-Forwarded-Encrypted: i=1; AHgh+RoBoy0VRL1qA3e8cRbRgjw5lx1R2hRxavPx5rtDdqhMdRF/D1xyVixEhr1WfqEOlSh1/Dv6CAxSNQM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMM/bzeDlw4nO2pEo+B4feq41uH+DeVAKVDNytjrO/umXD0wZt
	yJYZbZA9Sq4D/qf9bs0px1SwuJy9r57oLZygXv1HUOrh/QfzlvafqYbvOJuLjPXhr9jzbKpNY8O
	73YALR3aVfgJykO6/lMTkxpldM/kuJFI=
X-Gm-Gg: AR+sD13fxZinuTqqE/zDXfahHH5DBecEmQca+75YTIzvLIoFVZxpGI5ddYYAlcbNFT+
	meAjjKa1CVKz3aUF7uefmMq7ov1T8T47vE+cL9hbuCJ6KvwJ+mAn2uMERQ+fmtpO/cWg8hkcwdO
	kfrUyyZNgoMiYiKHWIbDuFc7OB/MwTY292CfEQvW+KpWWuzGkO8GAIyAOnPrw9X/sz6kczzF+eC
	YmgoffpoBLGhB1GWB+mo/NO2v7iIB7sSuS+1S/KEwut+tiYlCmvzg6Ozh/57dNO9X1p5X1x4f9j
	SM279Sc/IEy8pVZ1prdSVJnf8F2xT77vX/FlVGhQj81mwRvq+c6r3DaE9ZXY18ny54lu3fhOQnY
	DcysHjNNV4p50y4nVRjyfDZKpDyVZLA==
X-Received: by 2002:a17:90b:380e:b0:383:f52b:d616 with SMTP id
 98e67ed59e1d1-38fbc4249famr3228504a91.10.1785594377595; Sat, 01 Aug 2026
 07:26:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1785532392.git.alx@kernel.org> <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com> <20260731215122.4p4aepsbgeoibx74@illithid>
 <89c9b877-54a8-6a7c-016d-51e4be210ad6@redhat.com> <am0fnb4BMRrTajqx@devuan>
 <0407bda3-c03a-93cb-9400-5fb8256a30f2@redhat.com> <am0lAEb1wuCJPDk7@devuan>
 <9223d084-7de4-914f-9b53-8862510542d8@redhat.com> <20260731233253.7uwgq7m7vndqf2o2@illithid>
In-Reply-To: <20260731233253.7uwgq7m7vndqf2o2@illithid>
From: Christopher Bazley <chris.bazley.wg14@gmail.com>
Date: Sat, 1 Aug 2026 15:26:05 +0100
X-Gm-Features: AUfX_my066HKPfuwi7mF7N8nEdkz0opv0gNW_8N-KGuxQD1G5_PWyj4sV6wl47A
Message-ID: <CAEHU8x9cXuViHVSQY7iR+LtdSwHy9_og3FsbCWGGDUkN6e+gMw@mail.gmail.com>
Subject: Re: [PATCH 1/2] man/man3/{mem,strn}*(): SYNOPSIS, STANDARDS: Document
 these as provided by <memory.h>)
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Joseph Myers <josmyers@redhat.com>, Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org, 
	Keith Bostic <keith@bostic.com>, Mark Harris <mark.hsj@gmail.com>, 
	Nevin Liber <nevin@cplusplusguy.com>, JeanHeyd Meneide <phdofthehouse@gmail.com>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, 
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Aug 1, 2026 at 12:32=E2=80=AFAM G. Branden Robinson
<g.branden.robinson@gmail.com> wrote:
> WG14 has been moving away from that notion for decades now.  A recent
> example is <stdbit.h>.  Why not continue in that laudable direction?
>
> I think
>
> stdmem.h
> string.h
> stdstrn.h
>
> would sharply separate concerns and promote clearer reasoning among
> application developers.

I have been reluctant to stick my oar into this argument, but the
proposal above is the best I have seen so far.  The trouble with
Alex's assertion that the strn... functions are not string functions
and therefore must be memory functions is that it strikes me as a
false dichotomy.  I understand why he makes that claim, and I
understand the damage the confusion has caused, but I do not find it
entirely plausible given that strncat appends to a string and strncpy
can consume one.  I also understand the deep attraction of righting
past wrongs, but it seems to me that, in this instance, the past was
not so satisfactory either.

I am skeptical that many users will include header files that did not
exist before C2Y, but it may be worth trying. I do not think the
proposal to restore <memory.h> would be much better: it does not exist
on many platforms. If we are going to introduce a new separation, let
us make it a good one.

Christopher
