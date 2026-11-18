Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019097;
	b=ZVKpjH3ldqnz+r9EQYuM//nEXfBH5a5F9+6TEJHnlPq8sIoFMEerYdTLaH25W597yih5
	 mtAtOhuV0FuT8DdBuCJ5/6XBUNnTZa9mUgiZaHuQFNBeFctMd7MaLXJVefwJ6hiKPzhdU
	 dHHTPpSD5NIQ7CgaJTaTdyBBNdNLfZX6oOLjPAjuj/IhYHSlakeAaVofJD0Xow0acvFAO
	 cuLFzXkx1VpiUof2m2XYtWwMKieTDpFcExZKHEbrBJPmUjsLATZS4VdbvNqgIsfOrJ6LG
	 7lWfHIaqfRuSeEQ/9DI8wCtXZAEImukkApILpmyAH58Pr42tdvsIq9polRYAysMtkjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019097;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=IiCnW7EhhC7OY59u7hzrOC/1R6IqwI8NfwynrleJSA0=;
	b=TqTb49/t+EHdiOyYk4OEJvQulA/AjptpJiDHnhlzuSg2AhbKo81ELy9Zn0geY91JRYdj
	 521cSjy3EE9gUT/0Fuktj3/9dxpHDcMZd3KKJQgXuQg+XuruVigLc+mnGM+Cb/U8iTFRA
	 7i4bQyK77n5ZvUo145a3Rauw0Txswmqxpdb/cQvFEoMC93l1YsLsi+gV80tmoXn1UURG6
	 WRdTspdwZKckz+RY/+INLyNgAopjoc49TbI3+9kEKb8OClztDvTXUrzYSMD8Z/bX+6Pkm
	 cKiNCrQs2D5/sjVi+6EkMS2ZHkJvzwrJNm5HE2l+dtD7jRywnn2zzdR5FoKcvgRVfJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BraHAgIC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37216606A337
	for <linux-man@vger.kernel.org>; Wed, 18 Nov 2026 16:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BraHAgIC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48A9D1F000C8;
	Wed, 18 Nov 2026 16:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795019096;
	bh=IiCnW7EhhC7OY59u7hzrOC/1R6IqwI8NfwynrleJSA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BraHAgICqQVix2Sw/9Hg291V6btda1h6OxeQW+Vb/+JgVD4UoGVPigzrD+nGlCBEP
	 O1FHCkIcVv8042j5eMjlAgT2XvsHfphY9Wb0jM7Y/lyfKaRM6llNVWT+7BWepfbnRr
	 J41XeVpF4mM6niAvUD39Y0oEiLGiZbJXLeC2GF2RzQng38Xo/yR4g6bzOlshR/h8K9
	 7HRvd5BeiaxKSvsm7FBB4D4nLqFVR1wX8PmtuQ6y2wI4i39uFmJrhS4j0v202Glr0Q
	 hvOm0S76nq/qtSUr6v1zf1yEErfywZHh3HC4Pt4nQpOngy7QlNmH59HhrSQ2JQWP3o
	 00mIhVUrIFdKA==
Date: Wed, 18 Nov 2026 17:24:53 +0100
From: Christian Brauner <brauner@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>, 
	Alejandro Colomar <alx+linux-man@kernel.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, linux-man@vger.kernel.org, 
	Alexander Mikhalitsyn <alexander@mihalicyn.com>, Eric Dumazet <edumazet@kernel.org>
Subject: Re: [PATCH v2 6/8] man/man7/unix.7: Document SO_PASSPIDFD,
 SO_PEERPIDFD, and SCM_PIDFD
Message-ID: <20261118-schnorren-apotheke-markant-b8178cac4a9b@brauner>
References: <20261103202211.13820-1-gnoack3000@gmail.com>
 <20261103202211.13820-7-gnoack3000@gmail.com>
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
In-Reply-To: <20261103202211.13820-7-gnoack3000@gmail.com>

On Tue, Nov 03, 2026 at 09:22:08PM +0100, Günther Noack wrote:
> These were added in linux.git 5e2ff6704a27 (2023-06-12; "scm: add
> SO_PASSPIDFD and SCM_PIDFD") and 7b26952a91cf (2023-06-12; "net: core:
> add getsockopt SO_PEERPIDFD"), both in Linux 6.5.

Looks good.

Since 7.4 there's also SO_PASSPIDFD_THREAD, SO_PEERPIDFD_THREAD and
SCM_PIDFD_THREAD which hand out a thread pidfd (PIDFD_THREAD) instead
of one for the thread-group leader. Would be nice to document those as
well. Either here or in a follow-up.

Nit: if there's no sender pid no SCM_PIDFD message is generated at all.

Acked-by: Christian Brauner (Amutable) <brauner@kernel.org>
