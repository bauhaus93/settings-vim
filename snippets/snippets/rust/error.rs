#[derive(Debug)]
pub enum Error {
}

impl error::Error for Error {
    fn description(&self) -> &str {
        match *self {
        }
    }

    fn cause(&self) -> Option<&dyn error::Error> {
        match *self {
        }
    }
}

impl fmt::Display for Error {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match *self {
        }
    }
}
