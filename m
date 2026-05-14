Received: from cloud35.hostingpalvelu.fi (mail35.hostingpalvelu.fi [31.217.192.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9933F413B
	for <linux-man@vger.kernel.org>; Thu, 14 May 2026 21:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.217.192.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778793256; cv=none; b=CRyvbb0uPGnX3BYNl80ImVfYEHV5aiU4Zyqx0BEcGLeZ9pvRHcyQ2bY2ShdvdvLHqiYWzRZtpvBhXW2EHzPeA4TIWZMHnR4yJnOGWf8RjBxMnDEzU2mTgMDidcGV0O9R+CtKyptd3FSRMyUdUiBQN5jQc4LYzRjFJVwbachFPaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778793256; c=relaxed/simple;
	bh=tTjBE2G41jwRxcrQqJ0svr+qVvB14noxpBDObvjo8Ds=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QyT7Dvni6Iz1Cag1YRwFawimknzNf9Wa16320qmlHAHExEkeYkG3uqYbWGnk1aPcpeC0bhHHKb8KWtrlsLbwdu95zc2fyjJd7knsvqNdkA4FXZUX9IirYbSCY/2U14zj3A+J9i+IXCBiFJrWUupJc8x+51IuLfK4FJV0lt42jlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kolttonen.fi; spf=pass smtp.mailfrom=kolttonen.fi; dkim=pass (2048-bit key) header.d=kolttonen.fi header.i=@kolttonen.fi header.b=N37ttBIa; arc=none smtp.client-ip=31.217.192.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kolttonen.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kolttonen.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kolttonen.fi header.i=@kolttonen.fi header.b="N37ttBIa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kolttonen.fi; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=E5/+pdLXF526bQYfw747FpkqfEbpha8J/4lTFY+k7v8=; b=N37ttBIaIyh+U2qkyQl9iW+SaS
	mwdooBR/TRSF1L/DectpXrPBFhD7yNY47jMCWV7C2zbjDGfBYobKT/Wl27JBXpygSMkngUxmSXVWb
	LXEPB9iT9BjtrZFKjWGYdM0TLYJ70dPz64FF1juNnsNSdnKdnurldAEGuESWtn6a2p3HoTmEGjvkQ
	t/GLN+IkrTpNV30zd5797EvZOhEQoma9DhoSAbXIpFqEmtMQDXwqvset5b3p9Ys9uJ8ny99ncZ+ZV
	1iNkhMukogcDGEs8Kr1Ii4YD1liKDgbKOmIlYMGdH3WBSISf4IOkblQSS11DCQ2xIHUtmpmyxM/bN
	8wRFAi5A==;
Received: from 176-93-144-62.bb.dnainternet.fi ([176.93.144.62]:11490 helo=14-5A-FC-31-E8-67)
	by cloud35.hostingpalvelu.fi with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <kalevi@kolttonen.fi>)
	id 1wNdNp-0000000E6yC-2iVK;
	Fri, 15 May 2026 00:14:12 +0300
Date: Fri, 15 May 2026 00:14:10 +0300
From: Kalevi Kolttonen <kalevi@kolttonen.fi>
To: alx@kernel.org, linux-man@vger.kernel.org
Subject: reallocarray() is now part of POSIX
Message-ID: <agY7IsrJiFZdAreh@14-5A-FC-31-E8-67>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cloud35.hostingpalvelu.fi
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - kolttonen.fi
X-Get-Message-Sender-Via: cloud35.hostingpalvelu.fi: authenticated_id: kalevi@kolttonen.fi
X-Authenticated-Sender: cloud35.hostingpalvelu.fi: kalevi@kolttonen.fi
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Hello!

The man page for 'reallocarray' claims this function
is not standardized. However, it is now part of POSIX.

FreeBSD 15 man page says:

  reallocarray() conforms to IEEE Std 1003.1-2024 (“POSIX.1”).

br,
KK
