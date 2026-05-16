Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEB537DEA5
	for <linux-man@vger.kernel.org>; Sat, 16 May 2026 21:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778966162; cv=none; b=mELiKEtDOjpl7dgQIXIBWS544h83VctRJf5/oKGbxSmNMneFT3rPa/uFCiQsTHfcsHSPNqYLXSssSyS8ux2Z7czmpfejXrkFTxRy15vON48dP5QxlBKYPnzkTDrxEPehcP2WhP8ZdhxjqEOKBhKJR9C0xpoACbSP5SzM67ZoYsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778966162; c=relaxed/simple;
	bh=FZm3WfxvDMj4J+8sL/quz82Zc3g5Gfq4LX6rQ9HYrBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Omv+CPBmOKhjpHiiCtX6WOtWH69LWU00UH6hQPE/J6sCUWPPPW/v5A7fFD676b+qpSlKZA/u/196oszOVh3IN6XRC166oz3khUMsmzlifWVKAo3ooaOSKx5f8gXiLbCCxNo7fTVpAgVRqHzpFq63EFc2FlVoCbIgLydAfDbPhtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=disroot.org; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id BFB58272D4;
	Sat, 16 May 2026 23:15:59 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IlXyZWMh4hFj; Sat, 16 May 2026 23:15:59 +0200 (CEST)
Date: Sat, 16 May 2026 22:15:56 +0100
From: funsafemath <funsafemath@proton.me>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH 2/2] man/man2/seccomp.2: Document
 SECCOMP_FILTER_FLAG_WAIT_KILLABLE_RECV
Message-ID: <agjeH3-3PazHR1Df@nix-mail>
References: <agjZR_2uzuZCeMPs@nix-mail>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kun4lfece6jzk6aa"
Content-Disposition: inline
In-Reply-To: <agjZR_2uzuZCeMPs@nix-mail>


--kun4lfece6jzk6aa
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/2] man/man2/seccomp.2: Document
 SECCOMP_FILTER_FLAG_WAIT_KILLABLE_RECV
MIME-Version: 1.0

Sorry, set a wrong reply header, so message was sent in a separate thread


--kun4lfece6jzk6aa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQYodxNGi0n8z/zZSXIEdcNBZwqTgUCagjeigAKCRDIEdcNBZwq
TmeVAP9BkEh4XTlZ7gU96A0ZFpyEzO43/nyTgdrG/I6c79hztQEAmb6R+qc2DA8z
mJJ6wH1BvE65oTWiUQJNBJQQ6uDlLAE=
=+QM8
-----END PGP SIGNATURE-----

--kun4lfece6jzk6aa--
