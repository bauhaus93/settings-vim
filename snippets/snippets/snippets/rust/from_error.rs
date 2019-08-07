impl From<SourceError> for TargetError {
    fn from(err: SourceError) -> Self {
        TargetError::EnumType(err)
    }
}
