<div class="container">
    <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
        <ul class="nav col-10 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0 custom-font1" style="font-size: 25px;">
            <%=session.getAttribute("member")%>'s Board
        </ul>
        <ul class="nav col-2 custom-font2" style="font-size: 19px;">
            <li><a href="#" class="nav-link px-3">search</a></li>
            <li><a href="/board/write" class="nav-link px-3">New Write</a></li>
        </ul>

        <div class="dropdown text-end">
            <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle">
            </a>
            <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1" style="">
                <li><a class="dropdown-item" href="#">New project...</a></li>
                <li><a class="dropdown-item" href="#">Settings</a></li>
                <li><a class="dropdown-item" href="#">Profile</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">Sign out</a></li>
            </ul>
        </div>
    </div>
    <hr/>
</div>