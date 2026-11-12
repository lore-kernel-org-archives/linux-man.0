Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=104.156.224.86
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794452022;
	b=v6hjAEPSJNYYSdxLJDRuVc9ddhJknRHu5p8RXiG5V+EYe8YXSg1TdhYLT0cWC0zRMFPj
	 A/F1h3EKx93f7naIPaDhLT2rioLaGEbJaHpn/qmLdU6x5Y+UnF4icj2+VwiyhM/QCHYan
	 /fYI2CLQ01DbV4cJju74m3F/Z46G6iHU6bJ1mNfP7pFyKqub3D8JiWQXyro1yLwmUxims
	 5SWZhJf35Nr0DpX85TGE9vIqniOuHZPZYixAv9iDK7bIB+v7oc+9AEsdbLAkM2k1dB77C
	 6f+qudv3WiBmZ51WlLowPSkHXe2yXVBsITc1Z3/ZUrTT4SyoRtHEIYyvjsTrCUaWpuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794452022;
	h=DMARC-Filter:Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To:User-Agent;
	bh=LlKHrxU3kh1DGYewiB69DQtfW/HcBQSHbueWlCkTQNk=;
	b=biIPXUU2c8+pbMednJG5z9pF8EdBebobzKWKooU92Ep3fS4l5kK6Bz2IjDquxy2Nxmsm
	 grXvALWsDmUmXmzy8YBK/HhoCu8s9HJnx6ZZIJB/E1xUd5rVwPMATszrJ5UQM8Sa/zewo
	 6/fxeGRJSiYtTUNpixtm6vifUddlvF0DQ5BQoTIMLxp03BrMBWqh19KIQCVFr3VNBupxJ
	 nnv2DoKo49jeeH//u9TyuegOznVSuNpPLeF4U60bXiZrxtMlfgBCZLQ4QcCteziUgKHB1
	 h404VlXWJxGxLEhWzdnnu3FnK92l5tkmp5TNHF7Bg2NYCMnwoY9xW3mtlWXVPUvKPIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=libc.org;
	spf=pass smtp.mailfrom=aerifal.cx;
	arc=none smtp.remote-ip=104.156.224.86
Received: from brightrain.aerifal.cx (brightrain.aerifal.cx [104.156.224.86])
	(using TLSv1.2 with cipher ECDHE-ECDSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606EE606A321
	for <linux-man@vger.kernel.org>; Thu, 12 Nov 2026 02:53:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 606EE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=libc.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aerifal.cx
Date: Wed, 11 Nov 2026 21:53:39 -0500
From: Rich Felker <dalias@libc.org>
To: Vincent Lefevre <vincent@vinc17.net>,
	Alejandro Colomar <alx+linux-man@kernel.org>,
	Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org,
	libc-alpha@sourceware.org, Walter Harms <wharms@bfs.de>,
	~hallyn/shadow@lists.sr.ht, musl@lists.openwall.com
Subject: Re: [PATCH v1] man/man3/crypt.3: These functions accept many
 algorithms, not only DES
Message-ID: <20261112025339.GM26138@brightrain.aerifal.cx>
References: <313da4c4e217a58e49e981f62d16bd15c97352bf.1794268615.git.alx@kernel.org>
 <avJeq6_q5rpqoGlW@devuan>
 <20261112015223.GA242717@joooj.vinc17.net>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261112015223.GA242717@joooj.vinc17.net>
User-Agent: Mutt/1.9.5 (2018-04-13)

On Thu, Nov 12, 2026 at 02:52:23AM +0100, Vincent Lefevre wrote:
> Hi,
> 
> On 2026-11-10 01:01:19 +0100, Alejandro Colomar wrote:
> > $ MANWIDTH=64 diffman-git -U99 HEAD
> > --- HEAD^:man/man3/crypt.3
> > +++ HEAD:man/man3/crypt.3
> [...]
> >  STANDARDS
> >       crypt()
> >              POSIX.1‐2008.
> [...]
> >  NOTES
> > -   Features in glibc
> > -     The glibc version of this function supports additional
> > -     hashing algorithms.
> > -
> > +   salt
> >       If salt is a character string starting with the characters
> >       "$id$" followed by a string optionally terminated by "$",
> >       then the result has the form:
> >  
> >              $id$salt$hashed
> [...]
> 
> The "$" character is disallowed by POSIX (in 2008 and still in the
> current edition) in the salt argument:
> 
>   https://pubs.opengroup.org/onlinepubs/9699919799.2008edition/functions/crypt.html
>   https://pubs.opengroup.org/onlinepubs/9799919799/functions/crypt.html
> 
> (this breaks a "shall").
> 
> I think that something should be said about that.

That's the whole reason '$' was chosen: POSIX doesn't define the
behavior (since a "shall" is violated) so the implementation is free
to define a behavior here. The behaviors for the portable base64
character set documented in POSIX uses only 2 characters as salt
(insufficient) and the common agreed-upon definition for how they are
used is as salt for the classic DES-based password hash.

Rich
