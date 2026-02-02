Received: from mx1.b1-systems.de (mx1.b1-systems.de [159.69.135.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CA72D23B6
	for <linux-man@vger.kernel.org>; Mon,  2 Feb 2026 13:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.135.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770040093; cv=none; b=u52HIkgL8veJhixdcTVYQ5UpVrAJcUFI7fRXWMb61vlaUnt7vz4qUagflMsyBmeBqBnKvzpdmkf+YFvTdwWm0jK4b3KZ+wVGOxCJUEyvlAm6YQttE65PJlSt2rlfcJ8Jx2obJk7rErp4SWEZ5LHzvH5JMQJ0whwrgzs+dsjX9XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770040093; c=relaxed/simple;
	bh=uBOt5Po4Kdps8n35sag5/b2+aj9beXB+mHSviTvhcHg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=AyQu2BkuBaedFfa2tWp9DwOCqH97YZsMQsuTrBL6/uf9ugLQwokF1YqC/sGJLInSCStX+w1nPH0oHVJGJQJU/s1atLOP12iQCoFrJXajIJguxeuYHpv2Tcpf9OnV553bG/XVFtIHBZ3115heqGBEl0b6Qw302VXK1r4QXZN13KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=b1-systems.de; spf=pass smtp.mailfrom=b1-systems.de; dkim=pass (1024-bit key) header.d=b1-systems.de header.i=@b1-systems.de header.b=Jrhv041/; arc=none smtp.client-ip=159.69.135.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=b1-systems.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b1-systems.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=b1-systems.de header.i=@b1-systems.de header.b="Jrhv041/"
Date: Mon, 2 Feb 2026 14:48:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=b1-systems.de;
	s=default; t=1770040090;
	bh=uBOt5Po4Kdps8n35sag5/b2+aj9beXB+mHSviTvhcHg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Jrhv041//mIhqvaSXernQOBhY3tWeAGpBTjiplCD2qh4MFpmlPIbP8LRrzQbkdBpT
	 Gi9LBVibSBTJLuAoBZlopzTcHiFznRvvRqcC9PVx3rSlD9J/0FjwDaYGmWJfE7hYyH
	 /MoFJCRGp74i2t5H9Bvjl8hY4/SDOxB5nhR2iujY=
From: Thorsten Glaser <tglaser@b1-systems.de>
To: Alejandro Colomar <alx@kernel.org>
cc: linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man2/syscall.2: fix numbering for notes
In-Reply-To: <aYCnGFboK-95B8AY@devuan>
Message-ID: <726e286f-22e9-086c-fc0b-f1eb5c7afc70@b1-systems.de>
References: <7b1b7c56-ad07-40b7-5387-08a4b60e3078@b1-systems.de> <aYCnGFboK-95B8AY@devuan>
X-Zitierstil: Wir wechseln gerne von TOFU auf den Usenet-Zitierstandard; sprechen Sie uns einfach an!
X-Quoting-Style: We will gladly switch from top-posting to Usenet standard quoting style; please just ask!
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

Hi Alex,

>Thanks!  I've applied the patch, and amended the commit to change the
>format.  It's pushed already.

Thanks.

>See man-pages(7):

Sure, if you have a =E2=80=9Chouse style=E2=80=9D, by all means. I didn=E2=
=80=99t see that one.

I tend to just =E2=80=9C.Bl -enum=E2=80=9D in mdoc(7) =E2=98=BB and I was a=
 bit=E2=80=A6 left hanging
at the use of the legacy man(7) format in these manpages.

bye,
//Thorsten
--=20
Thorsten Glaser
Linux / Unix Developer
Tel.: +49 160 91168501
E-Mail: tglaser@b1-systems.de

B1 Systems GmbH
Osterfeldstra=C3=9Fe 7 / 85088 Vohburg / https://www.b1-systems.de/
GF: Ralph Dehner / Unternehmenssitz: Vohburg / AG: Ingolstadt, HRB 3537
