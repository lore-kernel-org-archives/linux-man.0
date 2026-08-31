Received: from mail.cock.li (mail.cock.li [37.120.193.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8144F3D9DD3
	for <linux-man@vger.kernel.org>; Mon, 31 Aug 2026 09:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.193.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788167500; cv=none; b=OvkY2ddkWPSvOu6v0GEbUV4irrtOyOVUQ0X/wS8j0uoiduugjL2mEmkk/QPQqjEnG5GrBfeknGkGDR0Z7zcrbRNpm2LgfbkbOtvQkXA3olI3QIkocoOr0XTFJKfyF9JktLhGiRFTvr4+T3zRHEjEhtFbYAWXF/7d0Fl5aZllIHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788167500; c=relaxed/simple;
	bh=kVIAdqtm9TtorKGuySrrADQTdY04F75cEGh6wSigtY0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To; b=W8T+/6s8LXAEVvGOv3AR69lxDEsn8wCVbjOVtdaHqufq5SjTP/HwIEfN4WZzOE9VV5r3y0NTeoO5OjhVP1hxWS4avhePRDpdAn2u9CVAXmAFMRRTDDLkeXpoaSqkR67ktimre7wwV9iJpHbDBcf5ysZzfqOElvG0tNg8ZvTEais=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=memeware.net; spf=pass smtp.mailfrom=memeware.net; dkim=pass (2048-bit key) header.d=memeware.net header.i=@memeware.net header.b=xkmLoewJ; arc=none smtp.client-ip=37.120.193.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=memeware.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=memeware.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=memeware.net header.i=@memeware.net header.b="xkmLoewJ"
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=memeware.net; s=mail;
	t=1788167485; bh=kVIAdqtm9TtorKGuySrrADQTdY04F75cEGh6wSigtY0=;
	h=Date:Cc:Subject:From:To:From;
	b=xkmLoewJsjZQMwex1cNCX/V8odc93LGy+uJF6ka2IoiTWk3Z0Hycq+3XZoaKzRdyV
	 Ga0LXxbwQbvtGlrXVTANfcYYc6NMMwGzGD6w8yglgfECxFcpZaO0Uw3aOHwgi0PFZu
	 4IctIgTk+/oZv37uNYBmTPtjpEcuzQrxTKj9sntqXlGy4w1/OYq/E4DLXk5Od+LOCA
	 end3GxPQTtbgtUhwwH2bbhFAAkaJCvOW7jArmcUE1H1QUFxMX3GE5cU1P/BqymrOtY
	 3Wzx+tQLQjsY/EyCpVbHwsEcdsQ+B3lNTdJUTeC7wrb1lTMYERBUBbRTB0ZKsqsRGK
	 rEMRyrWiyUmVw==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Aug 2026 09:09:46 +0000
Message-Id: <DL30FONT5B6G.1ETPJ04T023RU@memeware.net>
Cc: "linux-man" <linux-man@vger.kernel.org>
Subject: outb(2): terminology correction
From: "astian" <astian@memeware.net>
To: "Alejandro Colomar" <alx@kernel.org>

outb(2) says:

  You must compile with -O or -O2 or similar.  The functions are defined
  as inline macros, and will not be substituted in without optimization
  enabled, causing unresolved references at link time.

"inline macros [...] not substituted in without optimization" doesn't
make any sense.  C pre-processor macros cannot be inline or not inline.
Indeed these are inline *functions* (at least in this system) with
embedded assembly apparently referencing parameters (which, I surmise,
is why the functions need to be inlined by the compiler or the assembly
will not work).

From /usr/include/x86_64-linux-gnu/sys/io.h (glibc 2.43):

  [...]
  #if defined __GNUC__ && __GNUC__ >=3D 2

  static __inline unsigned char
  inb (unsigned short int __port)
  {
    unsigned char _v;

    __asm__ __volatile__ ("inb %w1,%0":"=3Da" (_v):"Nd" (__port));
    return _v;
  }

  [...]

  static __inline void
  outb (unsigned char __value, unsigned short int __port)
  {
    __asm__ __volatile__ ("outb %b0,%w1": :"a" (__value), "Nd" (__port));
  }

  [...]

So I would say just s/inline macros/inline functions/g.
