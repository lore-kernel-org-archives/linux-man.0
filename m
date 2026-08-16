Received: from master.debian.org (master.debian.org [82.195.75.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE1D282F30
	for <linux-man@vger.kernel.org>; Sun, 16 Aug 2026 12:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786882138; cv=none; b=UXn5TVVsxuJNcGnx9Mcov2gbw4HQ/soo9u6xAH5ok84DKsl4/nOgildecau4FYv3eW+ex3t8o9M2zU+AyrAeEL/TJd97Ceym1nnRVl0iAJ5YDL8OlO37zMMCAzlcp62uVlU39pbFfdOQ2w2F2GnCtD8oMKO+uLNDRcOoUS6HyQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786882138; c=relaxed/simple;
	bh=oT8rivDkcdYQH2P2E1wr3ClerN53KprFtMgYcJg1OAo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ufyx4j5PyWBdB0esZ2NK9lGrXmD9D5xQA/DGVu+gleFkYHrgvONubQXZ5+tb3NMNKRsKS6J1iRLH7NAqoTefrH3i2f0HiSSox0XZ5QXQ4KjiOSHOLCKE1oC9OhhDwXyqeuHKJ8T6Iqm3l0NwbXDtVIr2Z4jCiSfyc3LPtNKM21A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=master.debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=WuZzt1KE; arc=none smtp.client-ip=82.195.75.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=master.debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="WuZzt1KE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.master; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	In-Reply-To:References; bh=oT8rivDkcdYQH2P2E1wr3ClerN53KprFtMgYcJg1OAo=; b=Wu
	Zzt1KEHrWRmeRo0T8YgdGp7R/xojT/sCPV1Szp89/EzAa8+Y///cdlEeEOXJ9xda2FICQoRBG4cP6
	+mBBbLbutueMmmEhKY3a1qiFsfjp5a3O0AsD4MFW0LoA5yB3415UuLb1RfdZ6875wAJlZoPTyt5QH
	PjoBvEqyS3uy7BT02BP8lTDZxuB5GlVRTyHYzMFr179qHMJjZNeNYp7GuO5hpWpwOcqmH9oygN78O
	S0p8pKPL65JPeBuzYye0bOtTEAbwd/unlNdw9l0rPApEuMWKSENGuytbOmLxZI/zask8Gr5KmvEvZ
	vePgXYmC/LkpllLbiOH2CamNdXNPowLQ==;
Received: from guillem by master.debian.org with local (Exim 4.96)
	(envelope-from <guillem@master.debian.org>)
	id 1wvZRa-00CyKJ-0O;
	Sun, 16 Aug 2026 11:54:26 +0000
Date: Sun, 16 Aug 2026 13:54:24 +0200
From: Guillem Jover <guillem@debian.org>
To: linux-man@vger.kernel.org, libc-alpha@sourceware.org
Cc: Alejandro Colomar <alx@kernel.org>,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Subject: On <asm/termbits.h> and <asm/termios.h> usage in man pages
Message-ID: <aoGk8FSBlwYAmvu8@thunder.hadrons.org>
Mail-Followup-To: Guillem Jover <guillem@debian.org>,
	linux-man@vger.kernel.org, libc-alpha@sourceware.org,
	Alejandro Colomar <alx@kernel.org>,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi!

I was just refreshing my mind about documentation around TIOCGWINSZ,
and noticed the weird <asm/termbits.h> and <asm/termios.h> usage in
various ioctl man pages.

These originate from commit c023614536251bd6b47a0eab45ab3bcfd2ad9ec2,
where it states that the «struct termios» definitions in the
<termios.h> header are incompatible with the defined ioctl calls.

This seems problematic, for one because the <asm/*> headers are Linux
specific, so they reduce portability for all these macros, even when
they do not rely or make use of «struct termios». For another because if
there is a problem in glibc with the interaction between «struct termios»
and the ioctl calls, then that should be fixed in glibc, instead of
adding these workarounds in the man pages.

It seems the problem is that in glibc «struct termios» maps to the Linux
«struct termios2», but the macros for ioctls that use «struct termios»
do not match (for example TCGETS instead of TCGETS2)?


I think this should be fixed both in glibc, to make the definitions
coherent, and in man-pages to not use those Linux-only headers where
it is not necessary and then on a second stage to point back to the
portable headers once glibc has been fixed?

Thanks,
Guillem
