Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=155.133.131.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794448351;
	b=SfyCuEUV0lJflMj7TEoiUO0S6GW5GT8Z7HQao9JKEPWVTF5LdERbull9MUt3LnCYdutt
	 foHnoar28GqCZPnIBTk1OR+Wm7j1C14jwcw9G4twXAxpRN6VECZXgB8ZCIrbGAPdO6ifW
	 3C28Y+JvB7UwRE5uAyrIEgu+BzSiWO3xn2oIRHUBUljVd6B+eFS0yCDLGzHNZrhaVUq7h
	 UxnoJmh/VxFopaM+ssWkT5o/l7ksi1rCK1jUJlBRay/7VT79ltq5nEyzNQvNjHyj1C4fz
	 EKPQczFJGMx1VvFwY35jhKIW/T3/AlFq7UqjuAUtibakY46AMLM6sswS6GjCN825Kew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794448351;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Mailer-Info:User-Agent;
	bh=dLF/eyEg2EoDVky33GYugkyuqo4R99N761OKaK7Lz8s=;
	b=hJMFEgWCWVnRaXPxHEgpF17FT2zPIiEcY6YW41f/LHRckEvMByoEa6ObLVw42EeuxKX9
	 VRej6oUP8x/n3ZsMpRJxSG/EFuM2BD9zmzSsb38JaXAkjXUlj1DJKmSTdN5ATX8C1it12
	 GJzH3wmN7k1jhYO8vCS0JrsB70/ck6FIKMXHITzHP6v+kSUCu0tLAzdV5vf4NDGxmHmNv
	 tH/i0qStDjTG2BDmeOEkJZ+A2UK81Ci5XYPIVFw0/R3wAEE/NKs5iTu20gtEaAt+L4iNM
	 HJdm5R9ia9prxQWf+pOXfQba8WkuAWko2oT0J81FLL7FOcnbVorKZPsh0yg5DPFJtGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=vinc17.net;
	spf=pass smtp.mailfrom=vinc17.net;
	arc=none smtp.remote-ip=155.133.131.76
Received: from joooj.vinc17.net (joooj.vinc17.net [155.133.131.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42F8606A323
	for <linux-man@vger.kernel.org>; Thu, 12 Nov 2026 01:52:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C42F8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vinc17.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinc17.net
Received: by joooj.vinc17.net (Postfix, from userid 1000)
	id 51AAB487; Thu, 12 Nov 2026 02:52:23 +0100 (CET)
Date: Thu, 12 Nov 2026 02:52:23 +0100
From: Vincent Lefevre <vincent@vinc17.net>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org,
	libc-alpha@sourceware.org, Walter Harms <wharms@bfs.de>,
	Rich Felker <dalias@libc.org>, ~hallyn/shadow@lists.sr.ht,
	musl@lists.openwall.com
Subject: Re: [PATCH v1] man/man3/crypt.3: These functions accept many
 algorithms, not only DES
Message-ID: <20261112015223.GA242717@joooj.vinc17.net>
Mail-Followup-To: Vincent Lefevre <vincent@vinc17.net>,
	Alejandro Colomar <alx+linux-man@kernel.org>,
	Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org,
	libc-alpha@sourceware.org, Walter Harms <wharms@bfs.de>,
	Rich Felker <dalias@libc.org>, ~hallyn/shadow@lists.sr.ht,
	musl@lists.openwall.com
References: <313da4c4e217a58e49e981f62d16bd15c97352bf.1794268615.git.alx@kernel.org>
 <avJeq6_q5rpqoGlW@devuan>
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
In-Reply-To: <avJeq6_q5rpqoGlW@devuan>
X-Mailer-Info: https://www.vinc17.net/mutt/
User-Agent: Mutt/2.4.3+59 (844fcfe7) vl-188789 (2026-10-10)

Hi,

On 2026-11-10 01:01:19 +0100, Alejandro Colomar wrote:
> $ MANWIDTH=64 diffman-git -U99 HEAD
> --- HEAD^:man/man3/crypt.3
> +++ HEAD:man/man3/crypt.3
[...]
>  STANDARDS
>       crypt()
>              POSIX.1‐2008.
[...]
>  NOTES
> -   Features in glibc
> -     The glibc version of this function supports additional
> -     hashing algorithms.
> -
> +   salt
>       If salt is a character string starting with the characters
>       "$id$" followed by a string optionally terminated by "$",
>       then the result has the form:
>  
>              $id$salt$hashed
[...]

The "$" character is disallowed by POSIX (in 2008 and still in the
current edition) in the salt argument:

  https://pubs.opengroup.org/onlinepubs/9699919799.2008edition/functions/crypt.html
  https://pubs.opengroup.org/onlinepubs/9799919799/functions/crypt.html

(this breaks a "shall").

I think that something should be said about that.

-- 
Vincent Lefèvre <vincent@vinc17.net> - Web: <https://www.vinc17.net/>
100% accessible validated (X)HTML - Blog: <https://www.vinc17.net/blog/>
Work: CR INRIA - computer arithmetic / Pascaline project (LIP, ENS-Lyon)
