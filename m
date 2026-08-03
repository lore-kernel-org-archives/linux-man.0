Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABC82FC01B
	for <linux-man@vger.kernel.org>; Mon,  3 Aug 2026 16:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785773303; cv=pass; b=LYS7wknD4MnhT4nGRPb64zarZW85kyaSbxQ8TUhSATYlqlyH3wlui1L5y9rTwqwiSULz1HRDO6IfXQBRQTPpCN9jwH2w8Qo+RVomPBKFN13rTcJb/uJDkLWRChnJbPNd6zatVTqaUAXM8g3j+f1i/OKBNXRXgCk3lkIFSpMweKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785773303; c=relaxed/simple;
	bh=Kne3TIHqgW9zIUa2AfpBmhCcvLBZUwidI0wXEnlo1C8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t9/Zz01qCxgcoRvOTggHkCa7vMzsoa97pANXXoD+b1mhqLP1HZZxfyCsyKFz0hazWTJjuNSmnCgyIH1gN4Jbxx/RI9jPBpFvkTqNPCMrSsLvYxJcBBQSWCUxCLMLsxWCEGpVG0HaV8pdZjyRXj3Lkh9wYBFsTNWpDqtqAwIrWy0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NARdjDkQ; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NARdjDkQ"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b2a22c52c1so3886352e87.3
        for <linux-man@vger.kernel.org>; Mon, 03 Aug 2026 09:08:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785773300; cv=none;
        d=google.com; s=arc-20260327;
        b=Ca21QH8i4w9Ydy/rbizaF/5b4cMyHL1jrFUQeWmXSJ9Vm7lJ82qOyRMBVT+JWJskeQ
         3GAKEvtL70+X7ElRHSvF1/yLIdSK4Fw3uNK2QacJjmof4oz9/O3ZsOwgOhOR3LmHcXFz
         FIIBYxeKHLmLPSunqoFg0d1djQV0sak5M1BTzCOwySmgUCPKCtQC3qd294ZjOe9FqtTC
         n/ocpqgJimyv1T5SMIYhCHwmIYZJFD/zQeRw6Au9BEeup+vdCw8rSOoduyUcC06/9wC1
         5DqD4ImYcDQ/zUD+rnatwJVzyhsD66SD/cX17zLyJkAvqPD829ujMRAD4HNqYj0/8I36
         081Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=KK9OnzRjcww561ty5H+f7888WzoE7PlwbIcsL1y6J0g=;
        fh=naz1aRMY1KYOpJo6PCxp0HBivtO2QTAjBXMpJqMNvNs=;
        b=fEs8KcB15kI6Sn/+GubEzBqVN8u9FB3zEojsvz/rZ2e0JEm/jRSuXgM+s6HkFkGZAj
         M4ec7akHaA+riTG0Et+tHBnr1oYGs7ycekbB9m/tS1AYLXJVFVQ6yv08jFzdhpRWn6QN
         qtYhNuBGQomCA8L4+6ubzOO/P7vWHt1d3D/LmnZXgBNk7Ey/MF1ysqxuRYsEOS3hgM+o
         z90alGgCQdCX5+unwA3cjp2NJu46NkijvxZhEeTbfhBy9PAra3PcTrhZAFGxDGwr84rU
         BgksJbYDCLi7ZNr77Bd5cfNtTDmwX3KbnvnV9UzRCVNl2nQxqZenXToTlODC97uYqQvm
         3xkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785773300; x=1786378100; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KK9OnzRjcww561ty5H+f7888WzoE7PlwbIcsL1y6J0g=;
        b=NARdjDkQ7Z8uhvA5kPmYGsQ9RdlFaNCfyWBTueinXi3Z9YrDUMIKYM+89adjxUv9p6
         HxfH6+/b2rqLXHa0ip44Pk7sh7YqQ2THGYfwW+Ydk/wmFPZ6E+2zeJiRMTA6Hyagh8Rm
         XXLh1NPpkT4LcL2h+NYZgv9SdmskUlWNKVlEN7yZWkdfrKI2T9XPljx2XP7ETFv/Q3+E
         UoB3YNWGe/SSJ360ywcQVpjhL/2rzl9owE7gYvsU32aLqHi1HLvjkgkPadajbgqScTxf
         5MaPVxQUyTzABCClTX3HXnj9rDB0YDSh/L1bfTMvGdD3HWwOhnpX55jHvZ0w9yAZjabs
         sQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773300; x=1786378100;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KK9OnzRjcww561ty5H+f7888WzoE7PlwbIcsL1y6J0g=;
        b=IS/l6LxlhlBhwmTZzm5+3YrJTfZ11oltxAsdV4P7IS6MSqTg3tirOhzVY1rBUc5D1b
         meJixG1uTy+lJtdHbWHv2CAuOFghVHPThlWWNzf1x29UbtLFTnFAR8fcGx8cIaT19Pam
         q4/ksh32InvBoobFT6U9fCYF+B1tEgnf93yF7GEW7YLIwRdImfStEn5jlyVKucsGIjiC
         UbhUEdQfUy3V/UqWbImCWl8xKLHCdCyC1pWiLNu546zOxBpj9D+WIkiS80Pmdd9bPKiA
         79g+KOerfa6JzKoyGZt9DLPtl2UNzxln8JWJT+s8OibTBE6Ic5QsMwEu5SIS847nT4Kp
         oyqA==
X-Forwarded-Encrypted: i=1; AHgh+RoQ6LZWu0q0Gi6lUvSvlD+R7cG5lailuplQeFJIVwWm/j6RrBm/wqjF+VFCKscv12Cg2NXUnnlPKn0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywloo+7zIYspKqm30+CLzlCH0FYTYKfu4gFc3IjoQAIWrr3pl+T
	q4g+BHj7AL38l8nlZ0id6yGiF8NSVKS0pFyFF5g/HWMInnhR90AygLxthATyRTqngdtqJcx23TF
	pjhmPVXkazwBI0l+2V+tSfXsKDkQSRZc=
X-Gm-Gg: AR+sD11nUJ9wTs5AZO83mB8VX2zZWx6SDlr45NFKe/roQW4bjqCz5uQUvtm0D7ROtL2
	prPfRpRg8iPDrddC2WmuiHzPYgwadnd3BHbuHAqr0MT6uJ0Ji8ldd4ap2Sz8z/3Nfj25DLnkrxi
	xn+Kd34DMpDa+F4VjmstrLuLFzljRJWSO+4zo8MHMVrdzFH05C02k+wRiQAU2oj4APkPV+kNoKl
	5WVqR8qwaMUbCrrySqEaDxrD/8Sgf+Jc9t5J15xWksW+bVqH5x00uD2A3mV0dSzokg1GDT6NV/x
	6rM/t3bFnahKcv4kEgf0D2OnF/7yTEd8I0jCzjU/opmOjEb1P88oq3u2wGFQyXgk9y6mnvJEjR1
	IH0dPB0DpFgRJmOh8KAfct2PIAHeTdHZbQbJSUDtDebKX51u7HR9m3hrxc8IfpllPVXM+j9sxSf
	lfBumbthxrvwnHEFqKfiNz0v7m7G2byKZA+u3Pod9ilb0g03vS
X-Received: by 2002:ac2:5bc7:0:b0:5b0:177f:beab with SMTP id
 2adb3069b0e04-5b2e4f802d9mr1655382e87.44.1785773299956; Mon, 03 Aug 2026
 09:08:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <am50AM0bdufHa9W3@devuan> <15288158.RDIVbhacDa@cagnes>
 <am56ZBzNM5J07AUa@devuan> <f3f50282-8f40-449b-87c2-5df85fbfdc4e@cs.ucla.edu>
 <am6CnOddgaM10pry@devuan> <20260802000833.zpu27l7ibvrbouna@illithid>
 <am6PkypxYg-Fq4Iz@devuan> <87cxw1s58a.fsf@gmail.com> <am6X32HkGdm2xTd7@devuan>
 <alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk> <am-2d02e1qq78Asv@devuan>
In-Reply-To: <am-2d02e1qq78Asv@devuan>
Reply-To: noloader@gmail.com
From: Jeffrey Walton <noloader@gmail.com>
Date: Mon, 3 Aug 2026 12:07:41 -0400
X-Gm-Features: AUfX_mw0lQHzbjDYe8P_34bq0jdNPW4WXmT_IHN2h_n7KckA_Zlq3eiy501BJuU
Message-ID: <CAH8yC8mqbYSdnSPSUReFn5uq9beORx9r8qKUz--AD1KZ+oRQKA@mail.gmail.com>
Subject: Re: the Linux man-pages as an educational tool
To: libc-alpha@sourceware.org
Cc: Alejandro Colomar <alx@kernel.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>, 
	Collin Funk <collin.funk1@gmail.com>, 
	"G. Branden Robinson" <g.branden.robinson@gmail.com>, Paul Eggert <eggert@cs.ucla.edu>, 
	linux-man@vger.kernel.org, bug-gnulib@gnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 2, 2026 at 5:35=E2=80=AFPM Alejandro Colomar <alx@kernel.org> w=
rote:
>
> [...]
>
> Most programmers can live in the safe bubble of <string.h>: those
> functions always require a string as input, and always provide a string
> as output.  Plain and simple.  It's difficult to write bugs when using
> those.

I don't think it is simple to write safe (secure?) code using the
interfaces currently provided by libc.* Proof by counterexample:
CVE-2026-5358,
<https://sourceware.org/bugzilla/show_bug.cgi?id=3D34067>.  If the libc
maintainers can't write secure code using the existing interfaces,
then there's little hope for the rest of us.

[*] libc could provide safer interfaces, but it declined to provide
them.  Confer, the lack of support for Annex K and the safer string
functions.  (I'm aware of the politics and the past decisions by folks
like Ulrich Drepper).

Jeff
